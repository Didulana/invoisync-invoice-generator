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
    PdfPageFormat format,
  ) async {
    final pdf = pw.Document();
    final dateFormat = DateFormat('MMM dd, yyyy');

    pdf.addPage(
      pw.MultiPage(
        pageFormat: format,
        margin: const pw.EdgeInsets.all(32), // Tighter, safer margin
        build: (context) {
          return [
            // --- Header ---
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'INVOICE',
                  style: pw.TextStyle(
                    fontSize: 28,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Text(
                      'INV #: ${invoice.invoiceNumber}',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text('Date: ${dateFormat.format(invoice.issueDate)}'),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 30),

            // --- Client Info ---
            pw.Text(
              'Bill To:',
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.grey700,
              ),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              client.name,
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14),
            ),
            if (client.email != null && client.email!.isNotEmpty)
              pw.Text(client.email!),
            if (client.phone != null && client.phone!.isNotEmpty)
              pw.Text(client.phone!),
            if (client.billingAddress != null &&
                client.billingAddress!.isNotEmpty)
              pw.Text(client.billingAddress!),
            pw.SizedBox(height: 30),

            // --- Safe, Constrained Table ---
            pw.Table(
              border: pw.TableBorder.all(color: PdfColors.grey300, width: 1),
              // We specifically force column widths here so the engine doesn't crash
              columnWidths: const {
                0: pw.FlexColumnWidth(3), // Description (widest)
                1: pw.FlexColumnWidth(1), // Qty
                2: pw.FlexColumnWidth(1.5), // Price
                3: pw.FlexColumnWidth(1.5), // Total
              },
              children: [
                // Table Header Row
                pw.TableRow(
                  decoration: const pw.BoxDecoration(color: PdfColors.grey200),
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(
                        'Description',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(
                        'Qty',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(
                        'Price',
                        textAlign: pw.TextAlign.right,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(
                        'Total',
                        textAlign: pw.TextAlign.right,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                // Table Data Rows
                ...items.map((item) {
                  return pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text(item.name),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text(
                          item.quantity.toStringAsFixed(0),
                          textAlign: pw.TextAlign.center,
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text(
                          '\$${item.unitPrice.toStringAsFixed(2)}',
                          textAlign: pw.TextAlign.right,
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text(
                          '\$${item.lineTotal.toStringAsFixed(2)}',
                          textAlign: pw.TextAlign.right,
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
            pw.SizedBox(height: 20),

            // --- Totals ---
            pw.Container(
              alignment: pw.Alignment.centerRight,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text('Subtotal: \$${invoice.subtotal.toStringAsFixed(2)}'),
                  pw.Text('Tax: \$${invoice.taxTotal.toStringAsFixed(2)}'),
                  pw.Divider(),
                  pw.Text(
                    'Grand Total: \$${invoice.grandTotal.toStringAsFixed(2)}',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            // --- Terms (Safe Check) ---
            if (invoice.terms != null && invoice.terms!.trim().isNotEmpty) ...[
              pw.SizedBox(height: 40),
              pw.Text(
                'Terms & Notes',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
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
