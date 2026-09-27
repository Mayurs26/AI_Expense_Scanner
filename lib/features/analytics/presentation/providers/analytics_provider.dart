import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ai_expense_scanner/core/utils/spend_analyzer.dart';
import 'package:ai_expense_scanner/features/analytics/domain/entities/analytics_summary.dart';
import 'package:ai_expense_scanner/features/auth/presentation/providers/auth_provider.dart';
import 'package:ai_expense_scanner/features/expenses/data/repositories/expense_repository_impl.dart';
import 'package:ai_expense_scanner/features/expenses/presentation/providers/expenses_provider.dart';
import 'package:ai_expense_scanner/core/extensions/date_extensions.dart';

part 'analytics_provider.g.dart';

@riverpod
class AnalyticsNotifier extends _$AnalyticsNotifier {
  @override
  Future<AnalyticsSummaryData> build() async {
    ref.watch(expensesProvider); // auto refresh
    return _buildSummary();
  }

  Future<AnalyticsSummaryData> _buildSummary() async {
    final user = ref.read(authProvider).value;
    if (user == null) {
      return AnalyticsSummaryData(
          summary: const AnalyticsSummary(
              categoryBreakdown: [],
              weeklySpending: [],
              monthlyTrend: [],
              topCategories: []),
          unusualAlerts: []);
    }

    final db = ref.read(appDatabaseProvider);
    final repo = ExpenseRepositoryImpl(db);
    final now = DateTime.now();

    final allExpenses = await repo.getAllExpenses(user.id);
    final monthlyExpenses =
        await repo.getExpensesByMonth(user.id, now.month, now.year);
    final categories = await db.categoryDao.getAllCategories();

    // Category breakdown
    final Map<int, double> catTotals = {};
    for (final e in monthlyExpenses) {
      catTotals[e.categoryId] = (catTotals[e.categoryId] ?? 0) + e.totalAmount;
    }
    final totalSpend =
        catTotals.values.fold(0.0, (sum, v) => sum + v);

    final categoryBreakdown = catTotals.entries.map((entry) {
      final cat = categories.firstWhere((c) => c.id == entry.key,
          orElse: () => categories.first);
      return CategorySpend(
        categoryId: entry.key,
        categoryName: cat.name,
        categoryColor: cat.color,
        amount: entry.value,
        percentage: totalSpend > 0 ? (entry.value / totalSpend * 100) : 0,
      );
    }).toList()
      ..sort((a, b) => b.amount.compareTo(a.amount));

    // Weekly spending (last 7 days)
    final weeklySpending = <WeeklySpend>[];
    for (int i = 6; i >= 0; i--) {
      final day = now.subtract(Duration(days: i));
      final dayTotal = allExpenses
          .where((e) =>
              e.date.year == day.year &&
              e.date.month == day.month &&
              e.date.day == day.day)
          .fold(0.0, (sum, e) => sum + e.totalAmount);
      weeklySpending.add(WeeklySpend(
        dayLabel: day.shortDay,
        amount: dayTotal,
        date: day,
      ));
    }

    // Monthly trend (last 6 months)
    final monthlyTrend = <MonthlySpend>[];
    for (int i = 5; i >= 0; i--) {
      final month = now.month - i;
      final year = now.year + (month <= 0 ? -1 : 0);
      final adjustedMonth = month <= 0 ? month + 12 : month;
      final monthExpenses = allExpenses.where((e) =>
          e.date.month == adjustedMonth && e.date.year == year);
      final monthTotal =
          monthExpenses.fold(0.0, (sum, e) => sum + e.totalAmount);
      final dt = DateTime(year, adjustedMonth);
      monthlyTrend.add(MonthlySpend(
        monthLabel: dt.shortFormatted.split(' ').first,
        amount: monthTotal,
        month: adjustedMonth,
        year: year,
      ));
    }

    // Unusual spend detection
    final unusualAlerts = SpendAnalyzer.detectUnusualSpend(
      allExpenses: allExpenses,
      currentMonth: now.month,
      currentYear: now.year,
    );
    for (final alert in unusualAlerts) {
      final cat = categories.firstWhere((c) => c.id == alert.categoryId,
          orElse: () => categories.first);
      alert.categoryName = cat.name;
    }

    return AnalyticsSummaryData(
      summary: AnalyticsSummary(
        categoryBreakdown: categoryBreakdown,
        weeklySpending: weeklySpending,
        monthlyTrend: monthlyTrend,
        topCategories: categoryBreakdown.take(3).toList(),
      ),
      unusualAlerts: unusualAlerts,
    );
  }
}

class AnalyticsSummaryData {
  final AnalyticsSummary summary;
  final List<UnusualSpendAlert> unusualAlerts;

  AnalyticsSummaryData({required this.summary, required this.unusualAlerts});
}
