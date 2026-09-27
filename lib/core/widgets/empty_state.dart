import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

/// Illustrated empty state with animated icon, title, description, and optional CTA
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String? ctaLabel;
  final VoidCallback? onCta;
  final Color? iconColor;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.ctaLabel,
    this.onCta,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = iconColor ?? AppColors.accent;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: AppSizes.iconXl, color: color),
            )
                .animate()
                .scale(
                  duration: 400.ms,
                  curve: Curves.elasticOut,
                  begin: const Offset(0.5, 0.5),
                )
                .fadeIn(duration: 300.ms),
            const SizedBox(height: AppSizes.lg),
            Text(
              title,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 200.ms, duration: 300.ms).slideY(
                  begin: 0.2,
                  delay: 200.ms,
                  duration: 300.ms,
                ),
            const SizedBox(height: AppSizes.sm),
            Text(
              description,
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 300.ms, duration: 300.ms),
            if (ctaLabel != null && onCta != null) ...[
              const SizedBox(height: AppSizes.xl),
              ElevatedButton(
                onPressed: onCta,
                child: Text(ctaLabel!),
              ).animate().fadeIn(delay: 400.ms, duration: 300.ms),
            ],
          ],
        ),
      ),
    );
  }
}

/// Pre-configured empty states per screen
class EmptyStates {
  static Widget expenses({VoidCallback? onAdd}) => EmptyState(
        icon: Icons.receipt_long_outlined,
        title: 'No expenses yet',
        description: 'Add your first expense to start tracking your spending',
        ctaLabel: 'Add Expense',
        onCta: onAdd,
      );

  static Widget analytics() => const EmptyState(
        icon: Icons.bar_chart_rounded,
        title: 'No data yet',
        description:
            'Add some expenses to see your spending analytics and insights',
        iconColor: AppColors.info,
      );

  static Widget search() => const EmptyState(
        icon: Icons.search_off_rounded,
        title: 'No results found',
        description: 'Try a different search term or remove filters',
        iconColor: AppColors.textSecondary,
      );

  static Widget chat() => const EmptyState(
        icon: Icons.auto_awesome_rounded,
        title: 'Ask me anything',
        description:
            'I can help you understand your spending and find ways to save',
        iconColor: AppColors.accent,
      );
}
