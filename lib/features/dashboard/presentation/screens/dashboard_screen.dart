import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_expense_scanner/core/constants/app_colors.dart';
import 'package:ai_expense_scanner/core/constants/app_sizes.dart';
import 'package:ai_expense_scanner/core/extensions/currency_extensions.dart';
import 'package:ai_expense_scanner/core/widgets/empty_state.dart';
import 'package:ai_expense_scanner/core/widgets/skeleton_loader.dart';
import 'package:ai_expense_scanner/features/auth/presentation/providers/auth_provider.dart';
import 'package:ai_expense_scanner/features/dashboard/domain/entities/dashboard_summary.dart';
import 'package:ai_expense_scanner/features/dashboard/presentation/providers/dashboard_provider.dart';
import 'package:ai_expense_scanner/features/expenses/presentation/widgets/expense_list_tile.dart';
import 'package:ai_expense_scanner/features/settings/presentation/providers/settings_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(dashboardProvider);
    final user = ref.watch(authProvider).value;
    final settings = ref.watch(settingsProvider).value;
    final currencySymbol = settings?.currencySymbol ?? '₹';

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(dashboardProvider),
        child: dashboardAsync.when(
          loading: () => const DashboardSkeleton(),
          error: (e, _) => Center(child: Text('Error: $e')),
          data: (summary) => _DashboardContent(
            summary: summary,
            userName: user?.displayName ?? 'there',
            currencySymbol: currencySymbol,
          ),
        ),
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  final DashboardSummary summary;
  final String userName;
  final String currencySymbol;

  const _DashboardContent({
    required this.summary,
    required this.userName,
    required this.currencySymbol,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final firstName = userName.split(' ').first;

    return CustomScrollView(
      slivers: [
        // App bar
        SliverAppBar(
          floating: true,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Good ${_greeting()}! 👋',
                  style: theme.textTheme.bodySmall),
              Text(firstName,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  )),
            ],
          ),
          actions: [
            // Notification bell placeholder
            IconButton(
              icon: const Icon(Icons.notifications_none_rounded),
              onPressed: () {},
            ),
          ],
        ),

        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Hero spend card ---
              _HeroCard(summary: summary, currencySymbol: currencySymbol)
                  .animate()
                  .fadeIn(duration: 400.ms)
                  .slideY(begin: 0.1, duration: 400.ms),

              // --- Spending streak ---
              if (summary.spendingStreak > 0)
                _StreakCard(summary: summary)
                    .animate()
                    .fadeIn(delay: 100.ms, duration: 400.ms),

              // --- Budget progress ---
              if (summary.budgetProgress.isNotEmpty) ...[
                const _SectionHeader(
                    title: 'Budget Overview',
                    onViewAll: null),
                ...summary.budgetProgress
                    .take(4)
                    .map((p) => _BudgetProgressTile(
                          progress: p,
                          currencySymbol: currencySymbol,
                        )),
                const SizedBox(height: AppSizes.sm),
              ],

              // --- Quick actions ---
              _QuickActions().animate().fadeIn(delay: 200.ms, duration: 400.ms),

              // --- Recent expenses ---
              _SectionHeader(
                title: 'Recent Expenses',
                onViewAll: () => context.go('/history'),
              ).animate().fadeIn(delay: 250.ms),

              if (summary.recentExpenses.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSizes.xl),
                  child: EmptyStates.expenses(
                    onAdd: () => context.push('/add-expense'),
                  ),
                )
              else
                ...summary.recentExpenses.asMap().entries.map(
                      (e) => ExpenseListTile(
                        expense: e.value,
                        index: e.key,
                      ).animate().fadeIn(
                            delay: Duration(milliseconds: 300 + e.key * 60),
                          ),
                    ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ],
    );
  }

  String _greeting() {
    final h = DateTime.now().hour;
    if (h < 12) return 'morning';
    if (h < 17) return 'afternoon';
    return 'evening';
  }
}

class _HeroCard extends StatelessWidget {
  final DashboardSummary summary;
  final String currencySymbol;

  const _HeroCard({required this.summary, required this.currencySymbol});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSizes.pagePadding),
      height: AppSizes.heroCardHeight,
      decoration: BoxDecoration(
        gradient: AppColors.heroCardGradient,
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(AppSizes.cardPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Monthly Spend',
            style: TextStyle(color: Colors.white60, fontSize: 13),
          ),
          const SizedBox(height: AppSizes.xs),
          Text(
            summary.totalSpentThisMonth.formatted(symbol: currencySymbol),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
            ),
          ),
          const Spacer(),

          // Budget progress bar
          if (summary.monthlyBudget > 0) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  summary.isOverBudget ? '⚠️ Over budget' : 'Budget remaining',
                  style: const TextStyle(color: Colors.white60, fontSize: 12),
                ),
                Text(
                  summary.remainingBudget
                      .abs()
                      .formatted(symbol: currencySymbol),
                  style: TextStyle(
                    color: summary.isOverBudget
                        ? AppColors.error
                        : AppColors.accent,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.xs),
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.radiusFull),
              child: LinearProgressIndicator(
                value: summary.budgetUsagePercent,
                backgroundColor: Colors.white12,
                valueColor: AlwaysStoppedAnimation(
                  summary.isOverBudget ? AppColors.error : AppColors.accent,
                ),
                minHeight: 6,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _StreakCard extends StatelessWidget {
  final DashboardSummary summary;
  const _StreakCard({required this.summary});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppSizes.pagePadding, vertical: AppSizes.xs),
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          const Text('🔥', style: TextStyle(fontSize: 28)),
          const SizedBox(width: AppSizes.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  summary.streakMessage,
                  style: const TextStyle(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Keep it up! Stay under budget today.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BudgetProgressTile extends StatelessWidget {
  final BudgetProgress progress;
  final String currencySymbol;

  const _BudgetProgressTile(
      {required this.progress, required this.currencySymbol});

  @override
  Widget build(BuildContext context) {
    final color = Color(progress.categoryColor);
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSizes.pagePadding, 0,
          AppSizes.pagePadding, AppSizes.sm),
      child: Column(
        children: [
          Row(
            children: [
              Text(progress.categoryName,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      )),
              const Spacer(),
              Text(
                '${progress.spentAmount.formatted(symbol: currencySymbol)} / ${progress.budgetAmount.formatted(symbol: currencySymbol)}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.radiusFull),
            child: LinearProgressIndicator(
              value: progress.progress,
              backgroundColor: color.withValues(alpha: 0.12),
              valueColor: AlwaysStoppedAnimation(
                  progress.isOverBudget ? AppColors.error : color),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Quick Actions',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSizes.md),
          Row(
            children: [
              _QuickAction(
                icon: Icons.add_rounded,
                label: 'Add',
                color: AppColors.accent,
                onTap: () => context.push('/add-expense'),
              ),
              _QuickAction(
                icon: Icons.history_rounded,
                label: 'History',
                color: AppColors.info,
                onTap: () => context.go('/history'),
              ),
              _QuickAction(
                icon: Icons.auto_awesome_rounded,
                label: 'AI Chat',
                color: AppColors.catEntertainment,
                onTap: () => context.push('/ai-chat'),
              ),
              _QuickAction(
                icon: Icons.ios_share_rounded,
                label: 'Export',
                color: AppColors.catBusiness,
                onTap: () => context.go('/settings'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickAction({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(AppSizes.radiusMd),
              ),
              child: Icon(icon, color: color, size: AppSizes.iconMd),
            ),
            const SizedBox(height: AppSizes.xs),
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAll;

  const _SectionHeader({required this.title, this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSizes.pagePadding, AppSizes.md,
          AppSizes.pagePadding, AppSizes.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          if (onViewAll != null)
            TextButton(onPressed: onViewAll, child: const Text('View all')),
        ],
      ),
    );
  }
}
