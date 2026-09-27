import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ai_expense_scanner/features/auth/presentation/providers/auth_provider.dart';
import 'package:ai_expense_scanner/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:ai_expense_scanner/features/settings/domain/entities/app_settings.dart';
import 'package:ai_expense_scanner/features/settings/domain/repositories/settings_repository.dart';

part 'settings_provider.g.dart';

@riverpod
SettingsRepository settingsRepository(Ref ref) {
  final db = ref.read(appDatabaseProvider);
  return SettingsRepositoryImpl(db);
}

/// true = offline, false = online
@riverpod
Stream<bool> connectivity(Ref ref) async* {
  final connectivity = Connectivity();
  await for (final results in connectivity.onConnectivityChanged) {
    yield results.every((r) => r == ConnectivityResult.none);
  }
}

@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  @override
  Future<AppSettings> build() async {
    return ref.read(settingsRepositoryProvider).getSettings();
  }

  Future<void> updateTheme(String mode) async {
    await ref.read(settingsRepositoryProvider).updateTheme(mode);
    ref.invalidateSelf();
  }

  Future<void> updateCurrency(String symbol, String code) async {
    await ref.read(settingsRepositoryProvider).updateCurrency(symbol, code);
    ref.invalidateSelf();
  }

  Future<void> updateTotalBudget(double amount) async {
    await ref.read(settingsRepositoryProvider).updateTotalBudget(amount);
    ref.invalidateSelf();
  }

  Future<void> setBiometricEnabled(bool enabled) async {
    await ref.read(settingsRepositoryProvider).setBiometricEnabled(enabled);
    ref.invalidateSelf();
  }

  Future<void> clearAllData() async {
    state = const AsyncLoading();
    await ref.read(settingsRepositoryProvider).clearAllData();
    ref.invalidateSelf();
  }
}

@riverpod
ThemeMode themeMode(Ref ref) {
  final settings = ref.watch(settingsProvider).value;
  return switch (settings?.themeMode) {
    'dark' => ThemeMode.dark,
    'light' => ThemeMode.light,
    _ => ThemeMode.system,
  };
}
