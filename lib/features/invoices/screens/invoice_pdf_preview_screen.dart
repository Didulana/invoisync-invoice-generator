import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import '../../../core/database/app_database.dart';
import '../pdf_export/pdf_service.dart';

class InvoicePdfPreviewScreen extends StatelessWidget {
  final Invoice invoice;

  const InvoicePdfPreviewScreen({super.key, required this.invoice});

  Future<Uint8List> _generateDocument(
    BuildContext context,
    PdfPageFormat format,
  ) async {
    try {
      final database = Provider.of<AppDatabase>(context, listen: false);

      final client = await (database.select(
        database.clients,
      )..where((c) => c.id.equals(invoice.clientId))).getSingle();

      final items = await (database.select(
        database.invoiceLineItems,
      )..where((i) => i.invoiceId.equals(invoice.id))).get();

      // We now pass the 'format' requested by the viewer directly to our generator
      return await PdfService.generateInvoicePdf(
        invoice,
        client,
        items,
        format,
      );
    } catch (e, stackTrace) {
      debugPrint('PDF Error: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Invoice ${invoice.invoiceNumber}')),
      body: PdfPreview(
        build: (format) => _generateDocument(context, format),
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
        onError: (context, error) => Center(
          child: Text(
            'Error: $error',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
