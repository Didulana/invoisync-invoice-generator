import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as drift;
import '../../../core/database/app_database.dart';

class BusinessProfileScreen extends StatefulWidget {
  const BusinessProfileScreen({super.key});

  @override
  State<BusinessProfileScreen> createState() => _BusinessProfileScreenState();
}

class _BusinessProfileScreenState extends State<BusinessProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  // Text editing controllers to capture form inputs
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _taxNumberController = TextEditingController();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadExistingProfile();
  }

  // Queries the database to populate the inputs if a profile already exists
  Future<void> _loadExistingProfile() async {
    final database = Provider.of<AppDatabase>(context, listen: false);
    final profile = await database.getBusinessProfile();

    if (profile != null) {
      setState(() {
        _nameController.text = profile.name;
        _emailController.text = profile.email ?? '';
        _phoneController.text = profile.phone ?? '';
        _addressController.text = profile.address ?? '';
        _taxNumberController.text = profile.taxNumber ?? '';
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  // Triggers the Drift insertOnConflictUpdate query
  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    final database = Provider.of<AppDatabase>(context, listen: false);

    // Retrieve existing profile to preserve the UUID if it exists
    final existingProfile = await database.getBusinessProfile();
    final id = existingProfile?.id;

    final companion = BusinessProfileCompanion(
      // If editing, preserve the ID; if new, drift handles auto-generating the UUIDv4 string
      id: id != null ? drift.Value(id) : const drift.Value.absent(),
      name: drift.Value(_nameController.text.trim()),
      email: drift.Value(_emailController.text.trim()),
      phone: drift.Value(_phoneController.text.trim()),
      address: drift.Value(_addressController.text.trim()),
      taxNumber: drift.Value(_taxNumberController.text.trim()),
    );

    await database.saveBusinessProfile(companion);

    setState(() => _isLoading = false);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Business profile saved successfully!')),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _taxNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _isLoading ? null : _saveProfile,
          ),
        ],
      ),
      body: _isLoading
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
                        labelText: 'Business Name *',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          (value == null || value.trim().isEmpty)
                          ? 'Please enter a business name'
                          : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Billing Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _addressController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'Business Address',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _taxNumberController,
                      decoration: const InputDecoration(
                        labelText: 'Tax Number / Business Registration',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _saveProfile,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Save Profile',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
