import 'package:flutter/services.dart';

/// Centralized haptic feedback — one import, consistent feel
class HapticService {
  /// Light tap — for selections, chip taps
  static Future<void> light() => HapticFeedback.lightImpact();

  /// Medium tap — for button presses, confirmations
  static Future<void> medium() => HapticFeedback.mediumImpact();

  /// Heavy — for delete, destructive actions
  static Future<void> heavy() => HapticFeedback.heavyImpact();

  /// Selection click — for toggles, switches
  static Future<void> selection() => HapticFeedback.selectionClick();

  /// Success pattern — medium + light
  static Future<void> success() async {
    await HapticFeedback.mediumImpact();
    await Future.delayed(const Duration(milliseconds: 80));
    await HapticFeedback.lightImpact();
  }

  /// Error pattern — heavy + heavy
  static Future<void> error() async {
    await HapticFeedback.heavyImpact();
    await Future.delayed(const Duration(milliseconds: 100));
    await HapticFeedback.heavyImpact();
  }
}
