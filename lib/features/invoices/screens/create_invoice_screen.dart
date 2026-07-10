import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as drift;
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import '../../../core/database/app_database.dart';

// A temporary class to hold items before they are saved to the database
class _CartItem {
  final Item item;
  int quantity;

  _CartItem({required this.item, this.quantity = 1});

  double get lineTotal => item.unitPrice * quantity;
}

class CreateInvoiceScreen extends StatefulWidget {
  const CreateInvoiceScreen({super.key});

  @override
  State<CreateInvoiceScreen> createState() => _CreateInvoiceScreenState();
}

class _CreateInvoiceScreenState extends State<CreateInvoiceScreen> {
  bool _isLoading = true;
  bool _isSaving = false;

  // Database Data
  List<Client> _clients = [];
  List<Item> _catalogItems = [];

  // Form State
  Client? _selectedClient;
  final List<_CartItem> _cart = [];
  DateTime _issueDate = DateTime.now();
  DateTime _dueDate = DateTime.now().add(const Duration(days: 14));
  final _termsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    final database = Provider.of<AppDatabase>(context, listen: false);
    final clients = await database.getActiveClients();
    final items = await database.getActiveItems();

    setState(() {
      _clients = clients;
      _catalogItems = items;
      _isLoading = false;
    });
  }

  // --- Calculations ---
  double get _subtotal =>
      _cart.fold(0, (sum, cartItem) => sum + cartItem.lineTotal);

  double get _taxTotal {
    // Assuming a flat 10% tax for taxable items in this prototype
    const double taxRate = 0.10;
    return _cart
        .where((c) => c.item.taxable)
        .fold(0.0, (sum, c) => sum + (c.lineTotal * taxRate));
  }

  double get _grandTotal => _subtotal + _taxTotal;

  // --- Actions ---
  void _addItemToCart(Item item) {
    setState(() {
      // Check if item already exists in cart, if so, just increase quantity
      final existingIndex = _cart.indexWhere((c) => c.item.id == item.id);
      if (existingIndex >= 0) {
        _cart[existingIndex].quantity += 1;
      } else {
        _cart.add(_CartItem(item: item));
      }
    });
    Navigator.pop(context); // Close the bottom sheet
  }

  void _showAddItemSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Select Item from Catalog',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: _catalogItems.isEmpty
                    ? const Center(
                        child: Text('Your catalog is empty. Add items first.'),
                      )
                    : ListView.builder(
                        itemCount: _catalogItems.length,
                        itemBuilder: (context, index) {
                          final item = _catalogItems[index];
                          return ListTile(
                            leading: const Icon(Icons.add_circle_outline),
                            title: Text(item.name),
                            subtitle: Text(
                              '\$${item.unitPrice.toStringAsFixed(2)} / ${item.unitType}',
                            ),
                            onTap: () => _addItemToCart(item),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _generateInvoice() async {
    if (_selectedClient == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select a client')));
      return;
    }
    if (_cart.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one item')),
      );
      return;
    }

    setState(() => _isSaving = true);
    final database = Provider.of<AppDatabase>(context, listen: false);

    // 1. Generate IDs and Data
    final invoiceId = const Uuid().v4();
    final String generatedNumber =
        'INV-${DateTime.now().millisecondsSinceEpoch.toString().substring(5)}';

    // 2. Prepare the Invoice Header
    final invoiceCompanion = InvoicesCompanion.insert(
      id: drift.Value(invoiceId),
      invoiceNumber: generatedNumber,
      clientId: _selectedClient!.id,
      issueDate: _issueDate,
      dueDate: drift.Value(_dueDate),
      subtotal: drift.Value(_subtotal),
      taxTotal: drift.Value(_taxTotal),
      grandTotal: drift.Value(_grandTotal),
      status: const drift.Value('unpaid'),
      terms: drift.Value(_termsController.text.trim()),
    );

    // 3. Prepare the Line Items
    final List<InvoiceLineItemsCompanion> lineItemCompanions = _cart.map((
      cartItem,
    ) {
      return InvoiceLineItemsCompanion.insert(
        invoiceId: invoiceId,
        itemId: drift.Value(cartItem.item.id),
        name: cartItem.item.name,
        description: drift.Value(cartItem.item.description),
        quantity: drift.Value(cartItem.quantity.toDouble()),
        unitPrice: drift.Value(cartItem.item.unitPrice),
        lineTotal: drift.Value(cartItem.lineTotal),
      );
    }).toList();

    // 4. Save via our Drift Transaction Engine
    await database.createInvoiceWithItems(invoiceCompanion, lineItemCompanions);

    setState(() => _isSaving = false);
    if (mounted) {
      Navigator.pop(context, true); // Return true to trigger dashboard refresh
    }
  }

  @override
  void dispose() {
    _termsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading)
      return const Scaffold(body: Center(child: CircularProgressIndicator()));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Invoice'),
        actions: [
          _isSaving
              ? const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: _generateInvoice,
                ),
        ],
      ),
      body: _clients.isEmpty
          ? const Center(
              child: Text(
                'Please add a client in the CRM first.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // --- Client Selection ---
                  DropdownButtonFormField<Client>(
                    value: _selectedClient,
                    decoration: const InputDecoration(
                      labelText: 'Bill To (Client) *',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    items: _clients
                        .map(
                          (c) =>
                              DropdownMenuItem(value: c, child: Text(c.name)),
                        )
                        .toList(),
                    onChanged: (val) => setState(() => _selectedClient = val),
                  ),
                  const SizedBox(height: 24),

                  // --- Items Header ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Line Items',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: _showAddItemSheet,
                        icon: const Icon(Icons.add),
                        label: const Text('Add Item'),
                      ),
                    ],
                  ),
                  const Divider(),

                  // --- Cart List ---
                  if (_cart.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: Center(
                        child: Text(
                          'No items added yet.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ..._cart.map((cartItem) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        cartItem.item.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '\$${cartItem.item.unitPrice.toStringAsFixed(2)} x ${cartItem.quantity}',
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '\$${cartItem.lineTotal.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: Colors.red,
                            ),
                            onPressed: () => setState(() {
                              if (cartItem.quantity > 1) {
                                cartItem.quantity--;
                              } else {
                                _cart.remove(cartItem);
                              }
                            }),
                          ),
                        ],
                      ),
                    );
                  }),
                  const Divider(),
                  const SizedBox(height: 16),

                  // --- Totals Math ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Subtotal'),
                      Text('\$${_subtotal.toStringAsFixed(2)}'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Tax (10%)'),
                      Text('\$${_taxTotal.toStringAsFixed(2)}'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Grand Total',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${_grandTotal.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // --- Terms ---
                  TextField(
                    controller: _termsController,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      labelText: 'Invoice Terms & Notes (Optional)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // --- Save Button ---
                  ElevatedButton(
                    onPressed: _isSaving ? null : _generateInvoice,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Generate Invoice',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
