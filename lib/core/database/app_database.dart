import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';

part 'app_database.g.dart';

// Universal Sync columns for Phase 2 Cloud Sync
abstract class SyncableTable extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

// 1. Business Profile Table
class BusinessProfile extends SyncableTable {
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get taxNumber => text().nullable()();
  TextColumn get logoUri => text().nullable()();
}

// 2. Clients Table (Mini-CRM)
class Clients extends SyncableTable {
  TextColumn get name => text()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get billingAddress => text().nullable()();
  TextColumn get notes => text().nullable()();
}

// 3. Items Catalog Table (Reusable Products/Services)
class Items extends SyncableTable {
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  RealColumn get unitPrice => real().withDefault(const Constant(0.0))();
  TextColumn get unitType =>
      text().withDefault(const Constant('Item'))(); // e.g., hour, flat, item
  BoolColumn get taxable => boolean().withDefault(const Constant(true))();
}

// 4. Invoices Table (Top-level document details)
class Invoices extends SyncableTable {
  TextColumn get invoiceNumber => text()();
  TextColumn get clientId => text().references(Clients, #id)();
  DateTimeColumn get issueDate => dateTime()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  TextColumn get status =>
      text().withDefault(const Constant('draft'))(); // draft, unpaid, paid
  RealColumn get subtotal => real().withDefault(const Constant(0.0))();
  RealColumn get taxTotal => real().withDefault(const Constant(0.0))();
  RealColumn get discountTotal => real().withDefault(const Constant(0.0))();
  RealColumn get grandTotal => real().withDefault(const Constant(0.0))();
  TextColumn get terms => text().nullable()();
}

// 5. Invoice Line Items (Historical snapshot of what was billed)
class InvoiceLineItems extends SyncableTable {
  TextColumn get invoiceId => text().references(Invoices, #id)();
  TextColumn get itemId =>
      text().nullable()(); // Nullable if it's a custom one-off item
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  RealColumn get quantity => real().withDefault(const Constant(1.0))();
  RealColumn get unitPrice => real().withDefault(const Constant(0.0))();
  RealColumn get lineTotal => real().withDefault(const Constant(0.0))();
}

@DriftDatabase(
  tables: [BusinessProfile, Clients, Items, Invoices, InvoiceLineItems],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // ==========================================
  // 1. BUSINESS PROFILE QUERIES
  // ==========================================

  // Gets the single business profile (if it exists)
  Future<BusinessProfileData?> getBusinessProfile() {
    return select(businessProfile).getSingleOrNull();
  }

  // Inserts a new profile or updates the existing one
  Future<void> saveBusinessProfile(BusinessProfileCompanion profile) {
    return into(businessProfile).insertOnConflictUpdate(profile);
  }

  // ==========================================
  // 2. CLIENT QUERIES (Mini-CRM)
  // ==========================================

  // Get all active clients (ignoring deleted ones)
  Future<List<Client>> getActiveClients() {
    return (select(clients)..where((c) => c.isDeleted.equals(false))).get();
  }

  // Add a new client
  Future<int> insertClient(ClientsCompanion client) {
    return into(clients).insert(client);
  }

  // Soft delete a client (flips the isDeleted flag instead of dropping the row)
  Future<int> softDeleteClient(String id) {
    return (update(clients)..where((c) => c.id.equals(id))).write(
      const ClientsCompanion(isDeleted: Value(true)),
    );
  }

  // ==========================================
  // 3. ITEM CATALOG QUERIES
  // ==========================================

  Future<List<Item>> getActiveItems() {
    return (select(items)..where((i) => i.isDeleted.equals(false))).get();
  }

  Future<int> insertItem(ItemsCompanion item) {
    return into(items).insert(item);
  }

  Future<int> softDeleteItem(String id) {
    return (update(items)..where((i) => i.id.equals(id))).write(
      const ItemsCompanion(isDeleted: Value(true)),
    );
  }

  // ==========================================
  // 4. INVOICE ENGINE (The Complex Logic)
  // ==========================================

  // Get all active invoices ordered by issue date (newest first)
  Future<List<Invoice>> getActiveInvoices() {
    return (select(invoices)
          ..where((i) => i.isDeleted.equals(false))
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.issueDate, mode: OrderingMode.desc),
          ]))
        .get();
  }

  // The most critical function: Saving an Invoice AND its Line Items safely
  Future<void> createInvoiceWithItems(
    InvoicesCompanion invoice,
    List<InvoiceLineItemsCompanion> lineItems,
  ) async {
    // We wrap this in a transaction. If the app crashes after saving the invoice
    // but BEFORE saving the line items, the entire operation cancels itself.
    // This prevents orphaned data.
    await transaction(() async {
      // 1. Save the top-level invoice
      await into(invoices).insert(invoice);

      // 2. Save all the line items linked to this invoice
      for (final item in lineItems) {
        await into(invoiceLineItems).insert(item);
      }
    });
  }

  // Retrieve an invoice and all its associated line items (for generating the PDF)
  Future<List<InvoiceLineItem>> getLineItemsForInvoice(String invoiceId) {
    return (select(
      invoiceLineItems,
    )..where((li) => li.invoiceId.equals(invoiceId))).get();
  }

  // ==========================================
  // 5. INVOICE MANAGEMENT
  // ==========================================

  // Deletes an invoice and safely removes all its attached line items
  Future<void> deleteInvoice(String invoiceId) async {
    await transaction(() async {
      await (delete(
        invoiceLineItems,
      )..where((tbl) => tbl.invoiceId.equals(invoiceId))).go();
      await (delete(invoices)..where((tbl) => tbl.id.equals(invoiceId))).go();
    });
  }

  // Updates the status to 'paid' or 'unpaid'
  Future<int> updateInvoiceStatus(String invoiceId, String newStatus) {
    return (update(invoices)..where((tbl) => tbl.id.equals(invoiceId))).write(
      InvoicesCompanion(status: Value(newStatus)),
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
