import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as drift;
import '../../../core/database/app_database.dart';

class AddEditClientScreen extends StatefulWidget {
  final Client?
  client; // Null indicates "Add Mode", populated indicates "Edit Mode"

  const AddEditClientScreen({super.key, this.client});

  @override
  State<AddEditClientScreen> createState() => _AddEditClientScreenState();
}

class _AddEditClientScreenState extends State<AddEditClientScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _notesController = TextEditingController();

  bool _isSaving = false;
  bool get _isEditMode => widget.client != null;

  @override
  void initState() {
    super.initState();
    if (_isEditMode) {
      final c = widget.client!;
      _nameController.text = c.name;
      _emailController.text = c.email ?? '';
      _phoneController.text = c.phone ?? '';
      _addressController.text = c.billingAddress ?? '';
      _notesController.text = c.notes ?? '';
    }
  }

  Future<void> _saveClient() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);
    final database = Provider.of<AppDatabase>(context, listen: false);

    final companion = ClientsCompanion(
      // Keep structural key integrity if modifying records
      id: _isEditMode
          ? drift.Value(widget.client!.id)
          : const drift.Value.absent(),
      name: drift.Value(_nameController.text.trim()),
      email: drift.Value(
        _emailController.text.trim().isEmpty
            ? null
            : _emailController.text.trim(),
      ),
      phone: drift.Value(
        _phoneController.text.trim().isEmpty
            ? null
            : _phoneController.text.trim(),
      ),
      billingAddress: drift.Value(
        _addressController.text.trim().isEmpty
            ? null
            : _addressController.text.trim(),
      ),
      notes: drift.Value(
        _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
      ),
    );

    if (_isEditMode) {
      // Drift update path
      await (database.update(
        database.clients,
      )..where((t) => t.id.equals(widget.client!.id))).write(companion);
    } else {
      // Drift creation path
      await database.insertClient(companion);
    }

    setState(() => _isSaving = false);
    if (mounted) {
      Navigator.pop(
        context,
        true,
      ); // Return true to trigger data refresh on list screen
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditMode ? 'Edit Client Details' : 'Add New Client'),
      ),
      body: _isSaving
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Client or Company Name *',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) =>
                          (value == null || value.trim().isEmpty)
                          ? 'Please fill out client name'
                          : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email Address',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _addressController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'Billing Address',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.location_on),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _notesController,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        labelText: 'Internal Relationship Notes',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.description),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _saveClient,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        _isEditMode
                            ? 'Save System Changes'
                            : 'Create Client Profile',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
