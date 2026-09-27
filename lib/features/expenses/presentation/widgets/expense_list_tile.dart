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
import 'package:ai_expense_scanner/core/services/haptic_service.dart';
import 'package:ai_expense_scanner/features/expenses/domain/entities/expense_entity.dart';

class ExpenseListTile extends ConsumerWidget {
  final ExpenseEntity expense;
  final VoidCallback? onDelete;
  final int index;

  const ExpenseListTile({
    super.key,
    required this.expense,
    this.onDelete,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final categoryColor =
        expense.categoryColor != null ? Color(expense.categoryColor!) : AppColors.accent;

    return Dismissible(
      key: Key('expense_${expense.id}'),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: AppSizes.lg),
        color: AppColors.error,
        child: const Icon(Icons.delete_rounded, color: Colors.white),
      ),
      confirmDismiss: (_) async {
        await HapticService.heavy();
        if (!context.mounted) return false;
        return await _showDeleteConfirm(context);
      },
      onDismissed: (_) => onDelete?.call(),
      child: InkWell(
        onTap: () {
          HapticService.light();
          context.push('/expense/${expense.id}');
        },
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.pagePadding,
            vertical: AppSizes.sm + 2,
          ),
          child: Row(
            children: [
              // Thumbnail / Category Icon
              Hero(
                tag: 'expense_thumb_${expense.id}',
                child: _buildThumbnail(categoryColor),
              ),
              const SizedBox(width: AppSizes.md),

              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      expense.storeName,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: categoryColor.withValues(alpha: 0.12),
                            borderRadius:
                                BorderRadius.circular(AppSizes.radiusFull),
                          ),
                          child: Text(
                            expense.categoryName ?? 'Other',
                            style: TextStyle(
                              color: categoryColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSizes.xs),
                        Text(
                          expense.date.relativeDate,
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                    // Tags
                    if (expense.tags != null && expense.tags!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Wrap(
                        spacing: 4,
                        children: expense.tags!.parsedTags
                            .take(3)
                            .map(
                              (tag) => Text(
                                '#$tag',
                                style: const TextStyle(
                                  color: AppColors.accent,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ],
                ),
              ),

              // Amount
              Text(
                expense.totalAmount.formatted(),
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.accent,
                ),
              ),
            ],
          ),
        ),
      ),
    )
        .animate(delay: Duration(milliseconds: index * 50))
        .fadeIn(duration: 300.ms)
        .slideX(begin: 0.1, duration: 300.ms, curve: Curves.easeOut);
  }

  Widget _buildThumbnail(Color categoryColor) {
    if (expense.imagePath != null) {
      final file = File(expense.imagePath!);
      return ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        child: SizedBox(
          width: AppSizes.thumbnailSize,
          height: AppSizes.thumbnailSize,
          child: Image.file(
            file,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => _categoryIcon(categoryColor),
          ),
        ),
      );
    }
    return _categoryIcon(categoryColor);
  }

  Widget _categoryIcon(Color color) {
    return Container(
      width: AppSizes.thumbnailSize,
      height: AppSizes.thumbnailSize,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      ),
      child: Icon(
        Icons.receipt_long_rounded,
        color: color,
        size: AppSizes.iconMd,
      ),
    );
  }

  Future<bool?> _showDeleteConfirm(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete expense?'),
        content: Text('Delete "${expense.storeName}"? This cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(backgroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
