import '../../features/expenses/domain/entities/expense_entity.dart';
import '../extensions/date_extensions.dart';

/// Calculates consecutive days-under-budget streak
class StreakCalculator {
  /// Returns number of consecutive days (ending today) where
  /// total daily spend was within the daily budget.
  /// dailyBudget = monthlyBudget / daysInMonth
  static int calculateStreak({
    required List<ExpenseEntity> expenses,
    required double monthlyBudget,
  }) {
    if (monthlyBudget <= 0 || expenses.isEmpty) return 0;

    final now = DateTime.now();
    final daysInMonth =
        DateTime(now.year, now.month + 1, 0).day;
    final dailyBudget = monthlyBudget / daysInMonth;

    // Group expenses by day
    final Map<int, double> dailyTotals = {};
    for (final e in expenses) {
      final dayKey = e.date.daysSinceEpoch;
      dailyTotals[dayKey] = (dailyTotals[dayKey] ?? 0) + e.totalAmount;
    }

    int streak = 0;
    var checkDay = DateTime(now.year, now.month, now.day);

    while (true) {
      final key = checkDay.daysSinceEpoch;
      final dayTotal = dailyTotals[key] ?? 0.0;

      if (dayTotal <= dailyBudget) {
        streak++;
        checkDay = checkDay.subtract(const Duration(days: 1));
        // Don't go before 90 days back
        if (streak >= 90) break;
      } else {
        break;
      }
    }

    return streak;
  }

  /// Returns a motivational message based on streak length
  static String streakMessage(int streak) {
    if (streak == 0) return 'Start your streak today! 🎯';
    if (streak == 1) return '1 day under budget 🌱';
    if (streak < 7) return '$streak days under budget 🔥';
    if (streak < 14) return '$streak days — keep it up! 🚀';
    if (streak < 30) return '$streak days — you\'re on fire! 💪';
    return '$streak days — incredible discipline! 🏆';
  }
}
