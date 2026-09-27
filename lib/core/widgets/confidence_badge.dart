import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

/// OCR confidence level indicator badge
enum ConfidenceLevel { high, medium, low }

extension ConfidenceLevelExtension on ConfidenceLevel {
  Color get color => switch (this) {
        ConfidenceLevel.high => AppColors.success,
        ConfidenceLevel.medium => AppColors.warning,
        ConfidenceLevel.low => AppColors.error,
      };

  String get emoji => switch (this) {
        ConfidenceLevel.high => 'ðŸŸ¢',
        ConfidenceLevel.medium => 'ðŸŸ¡',
        ConfidenceLevel.low => 'ðŸ”´',
      };

  String get label => switch (this) {
        ConfidenceLevel.high => 'High',
        ConfidenceLevel.medium => 'Medium',
        ConfidenceLevel.low => 'Low',
      };

  static ConfidenceLevel fromString(String s) => switch (s.toLowerCase()) {
        'high' => ConfidenceLevel.high,
        'medium' => ConfidenceLevel.medium,
        _ => ConfidenceLevel.low,
      };
}

class ConfidenceBadge extends StatelessWidget {
  final ConfidenceLevel level;
  final bool showLabel;

  const ConfidenceBadge({
    super.key,
    required this.level,
    this.showLabel = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: level.color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppSizes.radiusFull),
        border: Border.all(color: level.color.withValues(alpha: 0.4), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: level.color,
              shape: BoxShape.circle,
            ),
          ),
          if (showLabel) ...[
            const SizedBox(width: 4),
            Text(
              level.label,
              style: TextStyle(
                color: level.color,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
