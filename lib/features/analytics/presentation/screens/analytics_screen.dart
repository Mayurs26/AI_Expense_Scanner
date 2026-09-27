import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_expense_scanner/core/constants/app_colors.dart';
import 'package:ai_expense_scanner/core/constants/app_sizes.dart';
import 'package:ai_expense_scanner/core/extensions/currency_extensions.dart';
import 'package:ai_expense_scanner/core/widgets/empty_state.dart';
import 'package:ai_expense_scanner/core/widgets/skeleton_loader.dart';
import 'package:ai_expense_scanner/features/analytics/domain/entities/analytics_summary.dart';
import 'package:ai_expense_scanner/features/analytics/presentation/providers/analytics_provider.dart';
import 'package:ai_expense_scanner/features/settings/presentation/providers/settings_provider.dart';

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsync = ref.watch(analyticsProvider);
    final settings = ref.watch(settingsProvider).value;
    final currencySymbol = settings?.currencySymbol ?? 'â‚¹';

    return Scaffold(
      appBar: AppBar(title: const Text('Analytics')),
      body: dataAsync.when(
        loading: () => const DashboardSkeleton(),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (data) {
          if (data.summary.categoryBreakdown.isEmpty) {
            return EmptyStates.analytics();
          }
          return _AnalyticsContent(
              data: data, currencySymbol: currencySymbol);
        },
      ),
    );
  }
}

class _AnalyticsContent extends StatelessWidget {
  final AnalyticsSummaryData data;
  final String currencySymbol;

  const _AnalyticsContent(
      {required this.data, required this.currencySymbol});

  @override
  Widget build(BuildContext context) {

    return ListView(
      padding: const EdgeInsets.all(AppSizes.pagePadding),
      children: [
        // Unusual spend alert
        if (data.unusualAlerts.isNotEmpty)
          _UnusualSpendBanner(alert: data.unusualAlerts.first)
              .animate()
              .fadeIn(duration: 300.ms),

        const SizedBox(height: AppSizes.md),

        // Pie chart
        _SectionCard(
          title: 'Spending by Category',
          child: _PieChartWidget(
            breakdown: data.summary.categoryBreakdown,
            currencySymbol: currencySymbol,
          ),
        ).animate().fadeIn(delay: 100.ms, duration: 400.ms),

        const SizedBox(height: AppSizes.md),

        // Weekly bar chart
        _SectionCard(
          title: 'This Week',
          child: _WeeklyBarChart(
            weekly: data.summary.weeklySpending,
            currencySymbol: currencySymbol,
          ),
        ).animate().fadeIn(delay: 200.ms, duration: 400.ms),

        const SizedBox(height: AppSizes.md),

        // Monthly trend
        _SectionCard(
          title: 'Monthly Trend',
          child: _MonthlyLineChart(
            monthly: data.summary.monthlyTrend,
            currencySymbol: currencySymbol,
          ),
        ).animate().fadeIn(delay: 300.ms, duration: 400.ms),

        const SizedBox(height: AppSizes.md),

        // Top categories
        _SectionCard(
          title: 'Top Categories',
          child: Column(
            children: data.summary.topCategories
                .map((cat) => _TopCategoryRow(
                      category: cat,
                      currencySymbol: currencySymbol,
                    ))
                .toList(),
          ),
        ).animate().fadeIn(delay: 400.ms, duration: 400.ms),

        const SizedBox(height: 100),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSizes.md),
            child,
          ],
        ),
      ),
    );
  }
}

class _PieChartWidget extends StatefulWidget {
  final List<CategorySpend> breakdown;
  final String currencySymbol;

  const _PieChartWidget(
      {required this.breakdown, required this.currencySymbol});

  @override
  State<_PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<_PieChartWidget> {
  int _touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: AppSizes.pieChartRadius * 2,
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (event, response) {
                    if (event is FlTapUpEvent) {
                      setState(() {
                        _touchedIndex =
                            response?.touchedSection?.touchedSectionIndex ?? -1;
                      });
                    }
                  },
                ),
                sections: widget.breakdown.take(6).toList().asMap().entries.map(
                  (e) {
                    final isTouch = e.key == _touchedIndex;
                    return PieChartSectionData(
                      color: Color(e.value.categoryColor),
                      value: e.value.amount,
                      radius: isTouch ? 55 : AppSizes.pieChartRadius / 2,
                      showTitle: isTouch,
                      title: '${e.value.percentage.toStringAsFixed(0)}%',
                      titleStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    );
                  },
                ).toList(),
                centerSpaceRadius: 40,
                sectionsSpace: 2,
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSizes.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.breakdown.take(5).map(
              (cat) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color(cat.categoryColor),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: AppSizes.xs),
                    Expanded(
                      child: Text(
                        cat.categoryName,
                        style: const TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      cat.amount.compact(symbol: widget.currencySymbol),
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ).toList(),
          ),
        ),
      ],
    );
  }
}

class _WeeklyBarChart extends StatelessWidget {
  final List<WeeklySpend> weekly;
  final String currencySymbol;

  const _WeeklyBarChart(
      {required this.weekly, required this.currencySymbol});

  @override
  Widget build(BuildContext context) {
    final maxY = weekly.map((w) => w.amount).fold(0.0, (a, b) => a > b ? a : b);
    return SizedBox(
      height: AppSizes.barChartHeight,
      child: BarChart(
        BarChartData(
          maxY: maxY * 1.2,
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              getTooltipItem: (group, _, rod, __) => BarTooltipItem(
                weekly[group.x].amount.formatted(symbol: currencySymbol),
                const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 12),
              ),
            ),
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (v, _) => Text(
                  weekly[v.toInt()].dayLabel,
                  style:
                      const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            leftTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          barGroups: weekly.asMap().entries.map(
            (e) {
              final isToday = e.value.date.day == DateTime.now().day &&
                  e.value.date.month == DateTime.now().month;
              return BarChartGroupData(
                x: e.key,
                barRods: [
                  BarChartRodData(
                    toY: e.value.amount,
                    color: isToday ? AppColors.accent : AppColors.accent.withValues(alpha: 0.4),
                    width: 20,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

class _MonthlyLineChart extends StatelessWidget {
  final List<MonthlySpend> monthly;
  final String currencySymbol;

  const _MonthlyLineChart(
      {required this.monthly, required this.currencySymbol});

  @override
  Widget build(BuildContext context) {
    final maxY = monthly.map((m) => m.amount).fold(0.0, (a, b) => a > b ? a : b);
    return SizedBox(
      height: AppSizes.lineChartHeight,
      child: LineChart(
        LineChartData(
          maxY: maxY * 1.2,
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipItems: (spots) => spots.map((s) {
                return LineTooltipItem(
                  monthly[s.x.toInt()].amount.formatted(symbol: currencySymbol),
                  const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 12),
                );
              }).toList(),
            ),
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (v, _) => Text(
                  monthly[v.toInt()].monthLabel,
                  style:
                      const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            leftTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (_) => FlLine(
              color: AppColors.divider.withValues(alpha: 0.5),
              strokeWidth: 1,
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: monthly.asMap().entries.map(
                (e) => FlSpot(e.key.toDouble(), e.value.amount),
              ).toList(),
              isCurved: true,
              color: AppColors.accent,
              barWidth: 3,
              dotData: const FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                color: AppColors.accent.withValues(alpha: 0.1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopCategoryRow extends StatelessWidget {
  final CategorySpend category;
  final String currencySymbol;

  const _TopCategoryRow(
      {required this.category, required this.currencySymbol});

  @override
  Widget build(BuildContext context) {
    final color = Color(category.categoryColor);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.sm),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
            ),
            child: Icon(Icons.receipt_outlined, color: color, size: 18),
          ),
          const SizedBox(width: AppSizes.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category.categoryName,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.radiusFull),
                  child: LinearProgressIndicator(
                    value: category.percentage / 100,
                    backgroundColor: color.withValues(alpha: 0.12),
                    valueColor: AlwaysStoppedAnimation(color),
                    minHeight: 4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSizes.md),
          Text(
            category.amount.formatted(symbol: currencySymbol),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _UnusualSpendBanner extends StatelessWidget {
  final dynamic alert;
  const _UnusualSpendBanner({required this.alert});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.warning.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(color: AppColors.warning.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          const Text('âš ï¸', style: TextStyle(fontSize: 22)),
          const SizedBox(width: AppSizes.md),
          Expanded(
            child: Text(
              alert.summary,
              style: const TextStyle(
                color: AppColors.warning,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
