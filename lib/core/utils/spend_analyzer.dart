import '../../features/expenses/domain/entities/expense_entity.dart';

/// Detects unusual spending patterns using local Dart logic (no AI required)
class SpendAnalyzer {
  /// Returns a list of categories where this month's spend
  /// is significantly higher than the 3-month average.
  static List<UnusualSpendAlert> detectUnusualSpend({
    required List<ExpenseEntity> allExpenses,
    required int currentMonth,
    required int currentYear,
    double thresholdMultiplier = 1.5, // 50% above average = unusual
  }) {
    final alerts = <UnusualSpendAlert>[];

    // Group by category
    final Map<int, List<ExpenseEntity>> byCategory = {};
    for (final e in allExpenses) {
      byCategory.putIfAbsent(e.categoryId, () => []).add(e);
    }

    for (final entry in byCategory.entries) {
      final categoryId = entry.key;
      final categoryExpenses = entry.value;

      // Current month total
      final currentMonthTotal = categoryExpenses
          .where((e) => e.date.month == currentMonth && e.date.year == currentYear)
          .fold(0.0, (sum, e) => sum + e.totalAmount);

      if (currentMonthTotal == 0) continue;

      // 3-month historical average (excluding current month)
      final historicalMonths = <int, double>{};
      for (final e in categoryExpenses) {
        if (e.date.year == currentYear && e.date.month == currentMonth) continue;
        final key = e.date.year * 100 + e.date.month;
        historicalMonths[key] = (historicalMonths[key] ?? 0) + e.totalAmount;
      }

      if (historicalMonths.isEmpty) continue;

      final recentMonths = historicalMonths.entries.toList()
        ..sort((a, b) => b.key.compareTo(a.key));
      final last3 = recentMonths.take(3).toList();
      final avg = last3.fold(0.0, (sum, e) => sum + e.value) / last3.length;

      if (avg > 0 && currentMonthTotal > avg * thresholdMultiplier) {
        alerts.add(UnusualSpendAlert(
          categoryId: categoryId,
          currentAmount: currentMonthTotal,
          averageAmount: avg,
          increasePercent:
              ((currentMonthTotal - avg) / avg * 100).roundToDouble(),
        ));
      }
    }

    return alerts..sort((a, b) => b.increasePercent.compareTo(a.increasePercent));
  }
}

class UnusualSpendAlert {
  final int categoryId;
  final double currentAmount;
  final double averageAmount;
  final double increasePercent;
  String? categoryName;

  UnusualSpendAlert({
    required this.categoryId,
    required this.currentAmount,
    required this.averageAmount,
    required this.increasePercent,
    this.categoryName,
  });

  String get summary =>
      '${categoryName ?? 'This category'} spend is ${increasePercent.toStringAsFixed(0)}% above your usual average';
}
