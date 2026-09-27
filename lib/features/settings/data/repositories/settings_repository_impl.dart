import 'package:ai_expense_scanner/core/database/app_database.dart';
import 'package:ai_expense_scanner/features/settings/domain/entities/app_settings.dart';
import 'package:ai_expense_scanner/features/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final AppDatabase _db;

  static const _themeKey = 'theme_mode';
  static const _currencySymbolKey = 'currency_symbol';
  static const _currencyCodeKey = 'currency_code';
  static const _totalBudgetKey = 'total_monthly_budget';
  static const _biometricKey = 'biometric_enabled';

  SettingsRepositoryImpl(this._db);

  @override
  Future<AppSettings> getSettings() async {
    final theme = await _db.settingsDao.getValue(_themeKey);
    final symbol = await _db.settingsDao.getValue(_currencySymbolKey);
    final code = await _db.settingsDao.getValue(_currencyCodeKey);
    final budget = await _db.settingsDao.getValue(_totalBudgetKey);
    final biometric = await _db.settingsDao.getValue(_biometricKey);

    return AppSettings(
      themeMode: theme?.value ?? 'system',
      currencySymbol: symbol?.value ?? '₹',
      currencyCode: code?.value ?? 'INR',
      totalMonthlyBudget: double.tryParse(budget?.value ?? '0') ?? 0.0,
      biometricEnabled: biometric?.value == 'true',
    );
  }

  @override
  Future<void> updateTheme(String themeMode) =>
      _db.settingsDao.setValue(_themeKey, themeMode);

  @override
  Future<void> updateCurrency(String symbol, String code) async {
    await _db.settingsDao.setValue(_currencySymbolKey, symbol);
    await _db.settingsDao.setValue(_currencyCodeKey, code);
  }

  @override
  Future<void> updateTotalBudget(double amount) =>
      _db.settingsDao.setValue(_totalBudgetKey, amount.toString());

  @override
  Future<void> setBiometricEnabled(bool enabled) =>
      _db.settingsDao.setValue(_biometricKey, enabled.toString());

  @override
  Future<void> clearAllData() async {
    await _db.transaction(() async {
      await _db.delete(_db.expenses).go();
      await _db.delete(_db.expenseItems).go();
      await _db.delete(_db.budgets).go();
      await _db.delete(_db.chatMessages).go();
      await _db.settingsDao.clearAll();
    });
  }
}
