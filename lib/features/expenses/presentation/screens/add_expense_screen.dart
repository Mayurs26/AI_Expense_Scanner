import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_expense_scanner/core/constants/app_colors.dart';
import 'package:ai_expense_scanner/core/constants/app_strings.dart';
import 'package:ai_expense_scanner/core/services/haptic_service.dart';
import 'package:ai_expense_scanner/features/auth/presentation/providers/auth_provider.dart';
import 'package:ai_expense_scanner/features/expenses/domain/entities/expense_entity.dart';
import 'package:ai_expense_scanner/features/expenses/presentation/providers/expenses_provider.dart';
import 'package:ai_expense_scanner/features/expenses/presentation/widgets/expense_form.dart';

class AddExpenseScreen extends ConsumerWidget {
  final ExpenseEntity? initialExpense;
  const AddExpenseScreen({super.key, this.initialExpense});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.addExpense)),
      body: ExpenseForm(
        initial: initialExpense,
        submitLabel: AppStrings.saveExpense,
        onSubmit: (expense, items) async {
          final user = ref.read(authProvider).value;
          if (user == null) return;

          final bool isUpdate = expense.id != null && expense.id! > 0;

          final withUser = expense.copyWith(
            userId: user.id,
            createdAt: isUpdate ? expense.createdAt : DateTime.now(),
            updatedAt: DateTime.now(),
          );

          if (!isUpdate) {
            // Duplicate check only for new expenses
            final duplicate =
                await ref.read(expensesProvider.notifier).checkDuplicate(
                      userId: user.id,
                      receiptNumber: withUser.receiptNumber,
                      amount: withUser.totalAmount,
                      date: withUser.date,
                    );

            if (duplicate != null && context.mounted) {
              final proceed = await _showDuplicateDialog(context, duplicate);
              if (proceed != true) return;
            }
          }

          if (isUpdate) {
            await ref.read(expensesProvider.notifier).updateExpense(withUser);
          } else {
            await ref.read(expensesProvider.notifier).addExpense(withUser);
          }

          await HapticService.success();

          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Expense saved successfully! 🎉'),
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

  Future<bool?> _showDuplicateDialog(
      BuildContext context, ExpenseEntity duplicate) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: const Icon(Icons.warning_amber_rounded,
            color: AppColors.warning, size: 40),
        title: const Text(AppStrings.duplicateFound),
        content: const Text(AppStrings.duplicateDesc),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text(AppStrings.cancel),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pop(ctx, false);
              ctx.push('/expense/${duplicate.id}');
            },
            child: const Text(AppStrings.viewExisting),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(backgroundColor: AppColors.warning),
            child: const Text(AppStrings.saveAnyway),
          ),
        ],
      ),
    );
  }
}
