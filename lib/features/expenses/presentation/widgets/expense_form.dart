import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_expense_scanner/core/constants/app_colors.dart';
import 'package:ai_expense_scanner/core/constants/app_sizes.dart';
import 'package:ai_expense_scanner/core/constants/app_strings.dart';
import 'package:ai_expense_scanner/features/expenses/domain/entities/expense_entity.dart';
import 'package:ai_expense_scanner/features/expenses/presentation/providers/expenses_provider.dart';

class ExpenseForm extends ConsumerStatefulWidget {
  final ExpenseEntity? initial;
  final void Function(ExpenseEntity expense, List<ExpenseItemEntity> items) onSubmit;
  final String submitLabel;

  const ExpenseForm({
    super.key,
    this.initial,
    required this.onSubmit,
    this.submitLabel = 'Save Expense',
  });

  @override
  ConsumerState<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends ConsumerState<ExpenseForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _storeCtrl;
  late final TextEditingController _amountCtrl;
  late final TextEditingController _gstCtrl;
  late final TextEditingController _receiptCtrl;
  late final TextEditingController _notesCtrl;
  late final TextEditingController _tagsCtrl;

  int? _selectedCategoryId;
  DateTime _selectedDate = DateTime.now();
  String _paymentMethod = 'Cash';
  final List<_ItemRow> _items = [];

  @override
  void initState() {
    super.initState();
    final e = widget.initial;
    _storeCtrl = TextEditingController(text: e?.storeName ?? '');
    _amountCtrl =
        TextEditingController(text: e?.totalAmount.toString() ?? '');
    _gstCtrl =
        TextEditingController(text: e?.gstAmount?.toString() ?? '');
    _receiptCtrl = TextEditingController(text: e?.receiptNumber ?? '');
    _notesCtrl = TextEditingController(text: e?.notes ?? '');
    _tagsCtrl = TextEditingController(text: e?.tags ?? '');
    _selectedCategoryId = e?.categoryId;
    _selectedDate = e?.date ?? DateTime.now();
    _paymentMethod = e?.paymentMethod ?? 'Cash';
    for (final item in e?.items ?? []) {
      _items.add(_ItemRow(
        nameCtrl: TextEditingController(text: item.itemName),
        priceCtrl: TextEditingController(text: item.price.toString()),
      ));
    }
  }

  @override
  void dispose() {
    _storeCtrl.dispose();
    _amountCtrl.dispose();
    _gstCtrl.dispose();
    _receiptCtrl.dispose();
    _notesCtrl.dispose();
    _tagsCtrl.dispose();
    for (final row in _items) {
      row.nameCtrl.dispose();
      row.priceCtrl.dispose();
    }
    super.dispose();
  }

  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      if (!mounted) return;
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDate),
      );
      if (pickedTime != null) {
        setState(() {
          _selectedDate = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  void _addItem() {
    setState(() {
      _items.add(_ItemRow(
        nameCtrl: TextEditingController(),
        priceCtrl: TextEditingController(),
      ));
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items[index].nameCtrl.dispose();
      _items[index].priceCtrl.dispose();
      _items.removeAt(index);
    });
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedCategoryId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a category')),
      );
      return;
    }

    final items = _items
        .where((r) => r.nameCtrl.text.trim().isNotEmpty)
        .map((r) => ExpenseItemEntity(
              expenseId: widget.initial?.id ?? 0,
              itemName: r.nameCtrl.text.trim(),
              price: double.tryParse(r.priceCtrl.text) ?? 0,
            ))
        .toList();

    final expense = (widget.initial ?? ExpenseEntity(
              id: 0,
              userId: '',
              storeName: '',
              totalAmount: 0,
              categoryId: 0,
              date: DateTime.now(),
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ))
        .copyWith(
      storeName: _storeCtrl.text.trim(),
      totalAmount: double.tryParse(_amountCtrl.text) ?? 0,
      gstAmount: _gstCtrl.text.isEmpty
          ? null
          : double.tryParse(_gstCtrl.text),
      categoryId: _selectedCategoryId!,
      date: _selectedDate,
      receiptNumber:
          _receiptCtrl.text.isEmpty ? null : _receiptCtrl.text.trim(),
      notes: _notesCtrl.text.isEmpty ? null : _notesCtrl.text.trim(),
      tags: _tagsCtrl.text.isEmpty ? null : _tagsCtrl.text.trim(),
      paymentMethod: _paymentMethod,
      items: items,
      updatedAt: DateTime.now(),
    );

    widget.onSubmit(expense, items);
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categoriesProvider);
    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(AppSizes.pagePadding),
        children: [
          // Store Name
          _buildField(
            controller: _storeCtrl,
            label: AppStrings.storeName,
            icon: Icons.store_outlined,
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'Store name is required' : null,
          ),
          const SizedBox(height: AppSizes.md),

          // Amount + GST row
          Row(
            children: [
              Expanded(
                flex: 3,
                child: _buildField(
                  controller: _amountCtrl,
                  label: AppStrings.totalAmount,
                  icon: Icons.currency_rupee_rounded,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                  ],
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Required';
                    if (double.tryParse(v) == null || double.parse(v) <= 0) {
                      return 'Enter valid amount';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              Expanded(
                flex: 2,
                child: _buildField(
                  controller: _gstCtrl,
                  label: AppStrings.gstAmount,
                  icon: Icons.percent_rounded,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.md),

          // Category
          categoriesAsync.when(
            data: (categories) {
              // Ensure selected category actually exists in the list
              if (_selectedCategoryId != null &&
                  !categories.any((c) => c.id == _selectedCategoryId)) {
                _selectedCategoryId = null;
              }
              
              return DropdownButtonFormField<int>(
                initialValue: _selectedCategoryId,
                decoration: _inputDecoration(AppStrings.category, Icons.category_outlined),
                items: categories
                    .map((c) => DropdownMenuItem(
                          value: c.id,
                          child: Text(c.name),
                        ))
                    .toList(),
                onChanged: (v) => setState(() => _selectedCategoryId = v),
                validator: (v) => v == null ? 'Please select a category' : null,
              );
            },
            loading: () => const LinearProgressIndicator(),
            error: (_, __) => const SizedBox(),
          ),
          const SizedBox(height: AppSizes.md),

          // Date picker
          InkWell(
            onTap: _pickDate,
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            child: InputDecorator(
              decoration: _inputDecoration(AppStrings.date, Icons.calendar_today_outlined),
              child: Text(
                '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ),
          const SizedBox(height: AppSizes.md),

          // Payment Method
          DropdownButtonFormField<String>(
            initialValue: _paymentMethod,
            decoration: _inputDecoration(AppStrings.paymentMethod, Icons.payment_rounded),
            items: ['Cash', 'Card', 'UPI', 'Net Banking', 'Other']
                .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                .toList(),
            onChanged: (v) => setState(() => _paymentMethod = v ?? 'Cash'),
          ),
          const SizedBox(height: AppSizes.md),

          // Receipt Number
          _buildField(
            controller: _receiptCtrl,
            label: AppStrings.receiptNumber,
            icon: Icons.tag_rounded,
          ),
          const SizedBox(height: AppSizes.md),

          // Notes
          _buildField(
            controller: _notesCtrl,
            label: AppStrings.notes,
            icon: Icons.notes_rounded,
            maxLines: 3,
          ),
          const SizedBox(height: AppSizes.md),

          // Tags
          _buildField(
            controller: _tagsCtrl,
            label: AppStrings.tags,
            icon: Icons.label_outline_rounded,
          ),
          const SizedBox(height: AppSizes.lg),

          // Line Items
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.lineItems, style: theme.textTheme.titleMedium),
              TextButton.icon(
                onPressed: _addItem,
                icon: const Icon(Icons.add_rounded, size: 18),
                label: const Text('Add Item'),
              ),
            ],
          ),
          ..._items.asMap().entries.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSizes.sm),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: e.value.nameCtrl,
                          decoration: _inputDecoration(AppStrings.itemName, Icons.fastfood_outlined),
                        ),
                      ),
                      const SizedBox(width: AppSizes.sm),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: e.value.priceCtrl,
                          decoration: _inputDecoration(AppStrings.price, Icons.currency_rupee_rounded),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline_rounded,
                            color: AppColors.error),
                        onPressed: () => _removeItem(e.key),
                      ),
                    ],
                  ),
                ),
              ),

          const SizedBox(height: AppSizes.xl),

          // Submit
          ElevatedButton(
            onPressed: _submit,
            child: Text(widget.submitLabel),
          ),
          const SizedBox(height: AppSizes.lg),
        ],
      ),
    );
  }

  TextFormField _buildField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: validator,
      maxLines: maxLines,
      decoration: _inputDecoration(label, icon),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, size: AppSizes.iconMd),
    );
  }
}

class _ItemRow {
  final TextEditingController nameCtrl;
  final TextEditingController priceCtrl;
  _ItemRow({required this.nameCtrl, required this.priceCtrl});
}
