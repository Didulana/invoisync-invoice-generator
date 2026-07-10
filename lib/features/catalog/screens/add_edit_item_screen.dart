import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as drift;
import '../../../core/database/app_database.dart';

class AddEditItemScreen extends StatefulWidget {
  final Item? item; // Null for addition profile, populated for edit pipeline

  const AddEditItemScreen({super.key, this.item});

  @override
  State<AddEditItemScreen> createState() => _AddEditItemScreenState();
}

class _AddEditItemScreenState extends State<AddEditItemScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();

  String _selectedUnitType = 'Item';
  bool _isTaxable = true;
  bool _isSaving = false;

  final List<String> _unitOptions = [
    'Item',
    'Hour',
    'Day',
    'Flat Fee',
    'Service',
  ];

  bool get _isEditMode => widget.item != null;

  @override
  void initState() {
    super.initState();
    if (_isEditMode) {
      final i = widget.item!;
      _nameController.text = i.name;
      _descriptionController.text = i.description ?? '';
      _priceController.text = i.unitPrice.toString();
      _selectedUnitType = _unitOptions.contains(i.unitType)
          ? i.unitType
          : 'Item';
      _isTaxable = i.taxable;
    }
  }

  Future<void> _saveItem() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);
    final database = Provider.of<AppDatabase>(context, listen: false);

    final price = double.tryParse(_priceController.text) ?? 0.0;

    final companion = ItemsCompanion(
      id: _isEditMode
          ? drift.Value(widget.item!.id)
          : const drift.Value.absent(),
      name: drift.Value(_nameController.text.trim()),
      description: drift.Value(
        _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
      ),
      unitPrice: drift.Value(price),
      unitType: drift.Value(_selectedUnitType),
      taxable: drift.Value(_isTaxable),
    );

    if (_isEditMode) {
      await (database.update(
        database.items,
      )..where((t) => t.id.equals(widget.item!.id))).write(companion);
    } else {
      await database.insertItem(companion);
    }

    setState(() => _isSaving = false);
    if (mounted) {
      Navigator.pop(context, true);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditMode ? 'Edit Catalog Item' : 'Add Catalog Item'),
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
                        labelText: 'Item or Service Name *',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          (value == null || value.trim().isEmpty)
                          ? 'Please enter an item name'
                          : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        labelText: 'Default Billing Description',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _priceController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Unit Price / Rate *',
                        border: OutlineInputBorder(),
                        prefixText: '\$ ',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty)
                          return 'Please enter a price';
                        if (double.tryParse(value) == null)
                          return 'Please enter a valid amount';
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _selectedUnitType,
                      decoration: const InputDecoration(
                        labelText: 'Unit Metric',
                        border: OutlineInputBorder(),
                      ),
                      items: _unitOptions.map((String unit) {
                        return DropdownMenuItem<String>(
                          value: unit,
                          child: Text(unit),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null)
                          setState(() => _selectedUnitType = value);
                      },
                    ),
                    const SizedBox(height: 16),
                    SwitchListTile(
                      title: const Text('Apply Default Standard Tax'),
                      subtitle: const Text(
                        'Toggle off if this product/service is completely tax-exempt',
                      ),
                      value: _isTaxable,
                      onChanged: (value) => setState(() => _isTaxable = value),
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _saveItem,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        _isEditMode ? 'Update Inventory' : 'Save to Catalog',
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
