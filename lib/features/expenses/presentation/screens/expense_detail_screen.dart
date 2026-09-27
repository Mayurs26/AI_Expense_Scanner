import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_expense_scanner/core/constants/app_colors.dart';
import 'package:ai_expense_scanner/core/constants/app_sizes.dart';
import 'package:ai_expense_scanner/core/extensions/currency_extensions.dart';
import 'package:ai_expense_scanner/core/extensions/date_extensions.dart';
import 'package:ai_expense_scanner/core/extensions/string_extensions.dart';
import 'package:ai_expense_scanner/features/expenses/domain/entities/expense_entity.dart';
import 'package:ai_expense_scanner/features/expenses/presentation/providers/expenses_provider.dart';

class ExpenseDetailScreen extends ConsumerWidget {
  final int expenseId;

  const ExpenseDetailScreen({super.key, required this.expenseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expensesAsync = ref.watch(expensesProvider);
    return expensesAsync.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (expenses) {
        final expense = expenses.cast<ExpenseEntity?>().firstWhere(
              (e) => e?.id == expenseId,
              orElse: () => null,
            );
        if (expense == null) {
          return const Scaffold(
              body: Center(child: Text('Expense not found')));
        }
        return _DetailView(expense: expense);
      },
    );
  }
}

class _DetailView extends StatelessWidget {
  final ExpenseEntity expense;
  const _DetailView({required this.expense});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categoryColor = expense.categoryColor != null
        ? Color(expense.categoryColor!)
        : AppColors.accent;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Hero header
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.edit_outlined, color: Colors.white),
                onPressed: () => context.push('/expense/${expense.id}/edit',
                    extra: expense),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'expense_thumb_${expense.id}',
                child: expense.imagePath != null
                    ? Image.file(
                        File(expense.imagePath!),
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            _gradientHeader(categoryColor),
                      )
                    : _gradientHeader(categoryColor),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.pagePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Store name + amount
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          expense.storeName,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Text(
                        expense.totalAmount.formatted(),
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.2),

                  const SizedBox(height: AppSizes.md),

                  // Tags
                  if (expense.tags != null && expense.tags!.isNotEmpty)
                    Wrap(
                      spacing: AppSizes.xs,
                      children: expense.tags!.parsedTags
                          .map((t) => Chip(
                                label: Text('#$t'),
                                labelStyle: const TextStyle(
                                  color: AppColors.accent,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                                backgroundColor:
                                    AppColors.accent.withValues(alpha: 0.1),
                                side: BorderSide.none,
                                padding: EdgeInsets.zero,
                              ))
                          .toList(),
                    ).animate().fadeIn(delay: 100.ms),

                  const SizedBox(height: AppSizes.lg),
                  const Divider(),
                  const SizedBox(height: AppSizes.md),

                  // Details grid
                  ...[
                    _DetailRow(
                        icon: Icons.category_outlined,
                        label: 'Category',
                        value: expense.categoryName ?? 'Other',
                        valueColor: categoryColor),
                    _DetailRow(
                        icon: Icons.calendar_today_outlined,
                        label: 'Date',
                        value: expense.date.formatted),
                    if (expense.paymentMethod != null)
                      _DetailRow(
                          icon: Icons.payment_rounded,
                          label: 'Payment',
                          value: expense.paymentMethod!),
                    if (expense.receiptNumber != null)
                      _DetailRow(
                          icon: Icons.tag_rounded,
                          label: 'Receipt #',
                          value: expense.receiptNumber!),
                    if (expense.gstAmount != null)
                      _DetailRow(
                          icon: Icons.percent_rounded,
                          label: 'GST / Tax',
                          value: expense.gstAmount!.formatted()),
                    if (expense.notes != null)
                      _DetailRow(
                          icon: Icons.notes_rounded,
                          label: 'Notes',
                          value: expense.notes!),
                  ]
                      .asMap()
                      .entries
                      .map((e) => e.value
                          .animate()
                          .fadeIn(delay: Duration(milliseconds: 150 + e.key * 50))
                          .slideX(begin: 0.1)),

                  // Line items
                  if (expense.items.isNotEmpty) ...[
                    const SizedBox(height: AppSizes.lg),
                    Text('Line Items', style: theme.textTheme.titleMedium),
                    const SizedBox(height: AppSizes.sm),
                    Container(
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius:
                            BorderRadius.circular(AppSizes.radiusMd),
                      ),
                      child: Column(
                        children: expense.items
                            .asMap()
                            .entries
                            .map((e) => ListTile(
                                  dense: true,
                                  title: Text(e.value.itemName),
                                  trailing: Text(
                                    e.value.price.formatted(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ).animate().fadeIn(delay: 400.ms),
                  ],

                  const SizedBox(height: AppSizes.xxl),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _gradientHeader(Color color) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color.withValues(alpha: 0.8), color],
        ),
      ),
      child: const Center(
        child: Icon(Icons.receipt_long_rounded, color: Colors.white, size: 72),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.sm),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.textSecondary),
          const SizedBox(width: AppSizes.md),
          SizedBox(
            width: 100,
            child: Text(label, style: theme.textTheme.bodySmall),
          ),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: valueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
