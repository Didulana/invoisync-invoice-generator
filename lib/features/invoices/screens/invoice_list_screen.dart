import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../../core/database/app_database.dart';
import 'create_invoice_screen.dart';
import 'invoice_pdf_preview_screen.dart';

class InvoiceListScreen extends StatefulWidget {
  const InvoiceListScreen({super.key});

  @override
  State<InvoiceListScreen> createState() => _InvoiceListScreenState();
}

class _InvoiceListScreenState extends State<InvoiceListScreen> {
  List<Invoice> _invoices = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadInvoices();
  }

  Future<void> _loadInvoices() async {
    setState(() => _isLoading = true);
    final database = Provider.of<AppDatabase>(context, listen: false);
    final activeInvoices = await database.getActiveInvoices();
    setState(() {
      _invoices = activeInvoices;
      _isLoading = false;
    });
  }

  // Helper method to color-code the invoice status
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'paid':
        return Colors.green;
      case 'unpaid':
        return Colors.orange;
      default:
        return Colors.grey; // Draft
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Invoices')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _invoices.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.receipt_long, size: 64, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  const Text(
                    'No invoices created yet',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _invoices.length,
              itemBuilder: (context, index) {
                final invoice = _invoices[index];

                return Dismissible(
                  key: Key(invoice.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  confirmDismiss: (direction) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Delete Invoice?'),
                          content: const Text('This action cannot be undone.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('CANCEL'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text(
                                'DELETE',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  onDismissed: (direction) async {
                    final database = Provider.of<AppDatabase>(
                      context,
                      listen: false,
                    );
                    await database.deleteInvoice(invoice.id);
                    _loadInvoices();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invoice deleted')),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: _getStatusColor(
                          invoice.status,
                        ).withValues(alpha: 0.2),
                        child: Icon(
                          Icons.receipt,
                          color: _getStatusColor(invoice.status),
                        ),
                      ),
                      title: Text(
                        invoice.invoiceNumber,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Issued: ${DateFormat('MMM dd, yyyy').format(invoice.issueDate)}',
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '\$${invoice.grandTotal.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                invoice.status.toUpperCase(),
                                style: TextStyle(
                                  color: _getStatusColor(invoice.status),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          // Status Toggle Menu
                          PopupMenuButton<String>(
                            icon: const Icon(Icons.more_vert),
                            onSelected: (String result) async {
                              final database = Provider.of<AppDatabase>(
                                context,
                                listen: false,
                              );
                              await database.updateInvoiceStatus(
                                invoice.id,
                                result,
                              );
                              _loadInvoices();
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                                  const PopupMenuItem<String>(
                                    value: 'unpaid',
                                    child: Text('Mark as Unpaid'),
                                  ),
                                  const PopupMenuItem<String>(
                                    value: 'paid',
                                    child: Text('Mark as Paid'),
                                  ),
                                ],
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                InvoicePdfPreviewScreen(invoice: invoice),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // Navigate to Create Invoice Screen
          final created = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateInvoiceScreen(),
            ),
          );

          // If the screen returns true, refresh the dashboard to show the new invoice
          if (created == true) {
            _loadInvoices();
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('New Invoice'),
      ),
    );
  }
}
