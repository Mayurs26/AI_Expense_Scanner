import '../entities/app_settings.dart';

abstract class SettingsRepository {
  Future<AppSettings> getSettings();
  Future<void> updateTheme(String themeMode);
  Future<void> updateCurrency(String symbol, String code);
  Future<void> updateTotalBudget(double amount);
  Future<void> setBiometricEnabled(bool enabled);
  Future<void> clearAllData();
}
