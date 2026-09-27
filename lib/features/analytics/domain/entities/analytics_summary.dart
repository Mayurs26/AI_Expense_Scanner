import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_summary.freezed.dart';

@freezed
sealed class AnalyticsSummary with _$AnalyticsSummary {
  const factory AnalyticsSummary({
    required List<CategorySpend> categoryBreakdown,
    required List<WeeklySpend> weeklySpending,
    required List<MonthlySpend> monthlyTrend,
    required List<CategorySpend> topCategories,
  }) = _AnalyticsSummary;
}

@freezed
sealed class CategorySpend with _$CategorySpend {
  const factory CategorySpend({
    required int categoryId,
    required String categoryName,
    required int categoryColor,
    required double amount,
    required double percentage,
  }) = _CategorySpend;
}

@freezed
sealed class WeeklySpend with _$WeeklySpend {
  const factory WeeklySpend({
    required String dayLabel,
    required double amount,
    required DateTime date,
  }) = _WeeklySpend;
}

@freezed
sealed class MonthlySpend with _$MonthlySpend {
  const factory MonthlySpend({
    required String monthLabel,
    required double amount,
    required int month,
    required int year,
  }) = _MonthlySpend;
}
