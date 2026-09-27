import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

/// Shimmer skeleton loader for loading states
class SkeletonLoader extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const SkeletonLoader({
    super.key,
    this.width = double.infinity,
    this.height = AppSizes.skeletonHeight,
    this.borderRadius = AppSizes.radiusSm,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Shimmer.fromColors(
      baseColor: isDark ? AppColors.darkSurfaceVariant : AppColors.surfaceVariant,
      highlightColor: isDark ? AppColors.darkCard : AppColors.cardLight,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurfaceVariant : AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

/// Skeleton for an expense list tile
class ExpenseTileSkeleton extends StatelessWidget {
  const ExpenseTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.pagePadding, vertical: AppSizes.sm),
      child: Row(
        children: [
          SkeletonLoader(
              width: AppSizes.thumbnailSize,
              height: AppSizes.thumbnailSize,
              borderRadius: AppSizes.radiusMd),
          SizedBox(width: AppSizes.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonLoader(width: 140, height: 14),
                SizedBox(height: AppSizes.xs),
                SkeletonLoader(width: 80, height: 12),
              ],
            ),
          ),
          SkeletonLoader(width: 60, height: 16),
        ],
      ),
    );
  }
}

/// Skeleton for the dashboard hero card
class HeroCardSkeleton extends StatelessWidget {
  const HeroCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSizes.pagePadding),
      height: AppSizes.heroCardHeight,
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
      ),
      padding: const EdgeInsets.all(AppSizes.cardPadding),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonLoader(width: 120, height: 14),
          SizedBox(height: AppSizes.sm),
          SkeletonLoader(width: 200, height: 36),
          Spacer(),
          SkeletonLoader(width: double.infinity, height: 8, borderRadius: 4),
          SizedBox(height: AppSizes.sm),
          SkeletonLoader(width: 160, height: 12),
        ],
      ),
    );
  }
}

/// Full-page skeleton for dashboard loading
class DashboardSkeleton extends StatelessWidget {
  const DashboardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HeroCardSkeleton(),
          const SizedBox(height: AppSizes.md),
          ...List.generate(4, (_) => const ExpenseTileSkeleton()),
        ],
      ),
    );
  }
}
