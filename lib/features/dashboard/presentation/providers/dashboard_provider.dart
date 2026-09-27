import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ai_expense_scanner/core/utils/streak_calculator.dart';
import 'package:ai_expense_scanner/features/auth/presentation/providers/auth_provider.dart';
import 'package:ai_expense_scanner/features/dashboard/domain/entities/dashboard_summary.dart';
import 'package:ai_expense_scanner/features/expenses/data/repositories/expense_repository_impl.dart';
import 'package:ai_expense_scanner/features/expenses/presentation/providers/expenses_provider.dart';
import 'package:ai_expense_scanner/features/settings/presentation/providers/settings_provider.dart';

part 'dashboard_provider.g.dart';

@riverpod
class DashboardNotifier extends _$DashboardNotifier {
  @override
  Future<DashboardSummary> build() async {
    // Watch expenses so dashboard auto-refreshes
    ref.watch(expensesProvider);
    return _buildSummary();
  }

  Future<DashboardSummary> _buildSummary() async {
    final user = ref.read(authProvider).value;
    if (user == null) {
      return const DashboardSummary(
        totalSpentThisMonth: 0,
        monthlyBudget: 0,
        spendingStreak: 0,
        streakMessage: '',
        budgetProgress: [],
        recentExpenses: [],
      );
    }

    final db = ref.read(appDatabaseProvider);
    final repo = ExpenseRepositoryImpl(db);
    final settings = ref.read(settingsProvider).value;
    final now = DateTime.now();

    // Monthly spend
    final monthlyTotal =
        await db.expenseDao.getTotalSpentInMonth(user.id, now.month, now.year);

    // Recent expenses (5)
    final recentRaw = await db.expenseDao.getRecentExpenses(user.id, limit: 5);
    final recentExpenses = await Future.wait(
      recentRaw.map((e) => repo.getAllExpenses(user.id).then(
            (all) => all.firstWhere((ex) => ex.id == e.id,
                orElse: () => throw Exception()),
          )),
    ).catchError((_) async {
      return repo.getAllExpenses(user.id).then((l) => l.take(5).toList());
    });

    // Budget progress per category
    final budgets =
        await db.budgetDao.getBudgetsByMonthYear(now.month, now.year);
    final categorySpend =
        await db.expenseDao.getSpendingByCategory(user.id, now.month, now.year);
    final categories = await db.categoryDao.getAllCategories();

    final budgetProgress = <BudgetProgress>[];
    for (final budget in budgets) {
      final cat = categories.firstWhere((c) => c.id == budget.categoryId,
          orElse: () => categories.first);
      budgetProgress.add(BudgetProgress(
        categoryId: budget.categoryId,
        categoryName: cat.name,
        categoryColor: cat.color,
        budgetAmount: budget.amount,
        spentAmount: categorySpend[budget.categoryId] ?? 0.0,
      ));
    }

    // Streak
    final allExpenses = await repo.getAllExpenses(user.id);
    final totalBudget = settings?.totalMonthlyBudget ?? 0.0;
    final streak = StreakCalculator.calculateStreak(
      expenses: allExpenses,
      monthlyBudget: totalBudget,
    );

    return DashboardSummary(
      totalSpentThisMonth: monthlyTotal,
      monthlyBudget: totalBudget,
      spendingStreak: streak,
      streakMessage: StreakCalculator.streakMessage(streak),
      budgetProgress: budgetProgress,
      recentExpenses: recentExpenses.toList(),
    );
  }
}
