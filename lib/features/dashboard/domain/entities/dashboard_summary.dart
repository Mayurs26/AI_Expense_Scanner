import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ai_expense_scanner/features/expenses/domain/entities/expense_entity.dart';

part 'dashboard_summary.freezed.dart';

@freezed
sealed class DashboardSummary with _$DashboardSummary {
  const DashboardSummary._();

  const factory DashboardSummary({
    required double totalSpentThisMonth,
    required double monthlyBudget,
    required int spendingStreak,
    required String streakMessage,
    required List<BudgetProgress> budgetProgress,
    required List<ExpenseEntity> recentExpenses,
  }) = _DashboardSummary;

  double get remainingBudget => monthlyBudget - totalSpentThisMonth;

  double get budgetUsagePercent =>
      monthlyBudget > 0 ? (totalSpentThisMonth / monthlyBudget).clamp(0.0, 1.0) : 0.0;

  bool get isOverBudget => totalSpentThisMonth > monthlyBudget;
}

@freezed
sealed class BudgetProgress with _$BudgetProgress {
  const BudgetProgress._();

  const factory BudgetProgress({
    required int categoryId,
    required String categoryName,
    required int categoryColor,
    required double budgetAmount,
    required double spentAmount,
  }) = _BudgetProgress;

  double get progress =>
      budgetAmount > 0 ? (spentAmount / budgetAmount).clamp(0.0, 1.0) : 0.0;

  bool get isOverBudget => spentAmount > budgetAmount;
}
