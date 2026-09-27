import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ai_expense_scanner/core/extensions/currency_extensions.dart';

part 'app_settings.freezed.dart';

@freezed
sealed class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default('system') String themeMode,
    @Default('₹') String currencySymbol,
    @Default('INR') String currencyCode,
    @Default(0.0) double totalMonthlyBudget,
    @Default(false) bool biometricEnabled,
    @Default(true) bool notificationsEnabled,
    @Default('en_IN') String locale,
  }) = _AppSettings;
}

extension AppSettingsX on AppSettings {
  SupportedCurrency get currency => SupportedCurrency.values.firstWhere(
        (c) => c.code == currencyCode,
        orElse: () => SupportedCurrency.inr,
      );
}
