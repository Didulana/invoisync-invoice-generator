import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';
import '../../../core/database/app_database.dart';

class PdfService {
  static Future<Uint8List> generateInvoicePdf(
    Invoice invoice,
    Client client,
    List<InvoiceLineItem> items,
    PdfPageFormat format, // <-- Now accepts the viewer's exact format
  ) async {
    final pdf = pw.Document();
    final dateFormat = DateFormat('MMM dd, yyyy');

    pdf.addPage(
      pw.MultiPage(
        pageFormat: format, // <-- Uses the safe format
        margin: const pw.EdgeInsets.all(48),
        build: (context) {
          return [
            // --- Header Section ---
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'INVOICE',
                      style: pw.TextStyle(
                        fontSize: 32,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 8),
                    pw.Text(
                      invoice.invoiceNumber,
                      style: const pw.TextStyle(
                        fontSize: 16,
                        color: PdfColors.grey700,
                      ),
                    ),
                  ],
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Text(
                      'Issue Date: ${dateFormat.format(invoice.issueDate)}',
                    ),
                    if (invoice.dueDate != null)
                      pw.Text(
                        'Due Date: ${dateFormat.format(invoice.dueDate!)}',
                      ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 40),

            // --- Billing Details (Removed pw.Expanded to prevent layout crashes) ---
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'Bill To:',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                pw.SizedBox(height: 4),
                pw.Text(
                  client.name,
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
                if (client.email != null && client.email!.isNotEmpty)
                  pw.Text(client.email!),
                if (client.phone != null && client.phone!.isNotEmpty)
                  pw.Text(client.phone!),
                if (client.billingAddress != null &&
                    client.billingAddress!.isNotEmpty) ...[
                  pw.SizedBox(height: 4),
                  pw.Text(client.billingAddress!),
                ],
              ],
            ),
            pw.SizedBox(height: 32),

            // --- Line Items Table ---
            pw.TableHelper.fromTextArray(
              headers: ['Description', 'Qty', 'Unit Price', 'Total'],
              data: items.map((item) {
                return [
                  item.name,
                  item.quantity.toString(),
                  '\$${item.unitPrice.toStringAsFixed(2)}',
                  '\$${item.lineTotal.toStringAsFixed(2)}',
                ];
              }).toList(),
              border: null,
              headerStyle: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.white,
              ),
              headerDecoration: const pw.BoxDecoration(
                color: PdfColors.blueGrey800,
              ),
              cellHeight: 30,
              cellAlignments: {
                0: pw.Alignment.centerLeft,
                1: pw.Alignment.center,
                2: pw.Alignment.centerRight,
                3: pw.Alignment.centerRight,
              },
            ),
            pw.Divider(color: PdfColors.grey400),
            pw.SizedBox(height: 16),

            // --- Totals Section ---
            pw.Container(
              alignment: pw.Alignment.centerRight,
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Subtotal:'),
                      pw.Text('Tax:'),
                      pw.SizedBox(height: 8),
                      pw.Text(
                        'Grand Total:',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(width: 24),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text(
                        '\$${invoice.subtotal?.toStringAsFixed(2) ?? '0.00'}',
                      ),
                      pw.Text(
                        '\$${invoice.taxTotal?.toStringAsFixed(2) ?? '0.00'}',
                      ),
                      pw.SizedBox(height: 8),
                      pw.Text(
                        '\$${invoice.grandTotal.toStringAsFixed(2)}',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 48),

            // --- Footer / Terms ---
            if (invoice.terms != null && invoice.terms!.isNotEmpty) ...[
              pw.Text(
                'Terms & Notes',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 4),
              pw.Text(
                invoice.terms!,
                style: const pw.TextStyle(color: PdfColors.grey700),
              ),
            ],
          ];
        },
      ),
    );

    return pdf.save();
  }
}
