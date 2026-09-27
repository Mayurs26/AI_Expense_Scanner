import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_expense_scanner/core/constants/app_colors.dart';
import 'package:ai_expense_scanner/core/constants/app_sizes.dart';
import 'package:ai_expense_scanner/core/constants/app_strings.dart';
import 'package:ai_expense_scanner/core/extensions/date_extensions.dart';
import 'package:ai_expense_scanner/core/widgets/empty_state.dart';
import 'package:ai_expense_scanner/core/widgets/skeleton_loader.dart';
import 'package:ai_expense_scanner/features/expenses/domain/entities/expense_entity.dart';
import 'package:ai_expense_scanner/features/expenses/presentation/providers/expenses_provider.dart';
import 'package:ai_expense_scanner/features/expenses/presentation/widgets/expense_list_tile.dart';
import 'package:go_router/go_router.dart';

class ExpenseHistoryScreen extends ConsumerStatefulWidget {
  const ExpenseHistoryScreen({super.key});

  @override
  ConsumerState<ExpenseHistoryScreen> createState() =>
      _ExpenseHistoryScreenState();
}

class _ExpenseHistoryScreenState extends ConsumerState<ExpenseHistoryScreen> {
  final _searchCtrl = TextEditingController();
  int? _selectedCategoryId;
  bool _isSearching = false;

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final expensesAsync = ref.watch(expensesProvider);
    final categoriesAsync = ref.watch(categoriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.expenseHistory),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search_rounded),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchCtrl.clear();
                  ref.read(expensesProvider.notifier).clearFilters();
                }
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          if (_isSearching)
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  AppSizes.pagePadding, 0, AppSizes.pagePadding, AppSizes.sm),
              child: TextField(
                controller: _searchCtrl,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: AppStrings.search,
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIcon: _searchCtrl.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _searchCtrl.clear();
                            ref
                                .read(expensesProvider.notifier)
                                .clearFilters();
                          },
                        )
                      : null,
                ),
                onChanged: (q) =>
                    ref.read(expensesProvider.notifier).searchExpenses(q),
              ),
            ),

          // Category filter chips
          categoriesAsync.when(
            data: (categories) => SizedBox(
              height: 44,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.pagePadding),
                children: [
                  _FilterChip(
                    label: 'All',
                    selected: _selectedCategoryId == null,
                    onSelected: (_) => setState(() {
                      _selectedCategoryId = null;
                      ref
                          .read(expensesProvider.notifier)
                          .clearFilters();
                    }),
                  ),
                  ...categories.map(
                    (cat) => _FilterChip(
                      label: cat.name,
                      selected: _selectedCategoryId == cat.id,
                      color: Color(cat.color),
                      onSelected: (_) => setState(() {
                        _selectedCategoryId = cat.id;
                        ref
                            .read(expensesProvider.notifier)
                            .filterByCategory(cat.id);
                      }),
                    ),
                  ),
                ],
              ),
            ),
            loading: () => const SizedBox(height: 44),
            error: (_, __) => const SizedBox(height: 44),
          ),

          const SizedBox(height: AppSizes.sm),

          // Expense list
          Expanded(
            child: expensesAsync.when(
              loading: () => ListView.builder(
                itemCount: 6,
                itemBuilder: (_, __) => const ExpenseTileSkeleton(),
              ),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (expenses) {
                if (expenses.isEmpty) {
                  return EmptyStates.expenses(
                    onAdd: () => context.push('/add-expense'),
                  );
                }

                // Group by date
                final grouped = _groupByDate(expenses);
                return RefreshIndicator(
                  onRefresh: () async =>
                      ref.invalidate(expensesProvider),
                  child: ListView.builder(
                    itemCount: grouped.length,
                    itemBuilder: (ctx, i) {
                      final entry = grouped[i];
                      if (entry is String) {
                        // Date header
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(
                              AppSizes.pagePadding,
                              AppSizes.md,
                              AppSizes.pagePadding,
                              AppSizes.xs),
                          child: Text(
                            entry,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: AppColors.textSecondary),
                          ),
                        );
                      }
                      final expense = entry as ExpenseEntity;
                      return ExpenseListTile(
                        expense: expense,
                        index: i,
                        onDelete: () => ref
                            .read(expensesProvider.notifier)
                            .deleteExpense(expense.id!),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Returns a flat list of [String (date header), ExpenseEntity, ...]
  List<dynamic> _groupByDate(List<ExpenseEntity> expenses) {
    final result = <dynamic>[];
    String? lastHeader;

    for (final expense in expenses) {
      final header = expense.date.relativeDate;
      if (header != lastHeader) {
        result.add(header);
        lastHeader = header;
      }
      result.add(expense);
    }
    return result;
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final Color? color;
  final void Function(bool) onSelected;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onSelected,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final chipColor = color ?? AppColors.accent;
    return Padding(
      padding: const EdgeInsets.only(right: AppSizes.sm),
      child: FilterChip(
        label: Text(label),
        selected: selected,
        onSelected: onSelected,
        selectedColor: chipColor.withValues(alpha: 0.2),
        checkmarkColor: chipColor,
        labelStyle: TextStyle(
          color: selected ? chipColor : null,
          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
        ),
        side: selected
            ? BorderSide(color: chipColor, width: 1.5)
            : BorderSide.none,
      ),
    );
  }
}
