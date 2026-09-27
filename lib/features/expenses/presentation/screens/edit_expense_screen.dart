import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_expense_scanner/core/constants/app_colors.dart';
import 'package:ai_expense_scanner/core/constants/app_strings.dart';
import 'package:ai_expense_scanner/core/services/haptic_service.dart';
import 'package:ai_expense_scanner/features/expenses/domain/entities/expense_entity.dart';
import 'package:ai_expense_scanner/features/expenses/presentation/providers/expenses_provider.dart';
import 'package:ai_expense_scanner/features/expenses/presentation/widgets/expense_form.dart';

class EditExpenseScreen extends ConsumerWidget {
  final ExpenseEntity expense;

  const EditExpenseScreen({super.key, required this.expense});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Expense'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline_rounded, color: AppColors.error),
            tooltip: AppStrings.deleteExpense,
            onPressed: () => _confirmDelete(context, ref),
          ),
        ],
      ),
      body: ExpenseForm(
        initial: expense,
        submitLabel: AppStrings.updateExpense,
        onSubmit: (updated, _) async {
          await ref
              .read(expensesProvider.notifier)
              .updateExpense(updated);
          await HapticService.success();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Expense updated! ✅'),
                backgroundColor: AppColors.success,
                behavior: SnackBarBehavior.floating,
              ),
            );
            context.pop();
          }
        },
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(AppStrings.deleteConfirm),
        content: Text(
            'Delete "${expense.storeName}"? ${AppStrings.deleteDesc}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text(AppStrings.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(backgroundColor: AppColors.error),
            child: const Text(AppStrings.delete),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      await HapticService.heavy();
      await ref
          .read(expensesProvider.notifier)
          .deleteExpense(expense.id!);
      if (context.mounted) context.go('/history');
    }
  }
}
