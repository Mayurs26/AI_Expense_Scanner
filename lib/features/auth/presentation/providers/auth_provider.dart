import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ai_expense_scanner/core/database/app_database.dart';
import 'package:ai_expense_scanner/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:ai_expense_scanner/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ai_expense_scanner/features/auth/domain/entities/user_entity.dart';
import 'package:ai_expense_scanner/features/auth/domain/repositories/auth_repository.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) => AppDatabase();

@riverpod
AuthRepository authRepository(Ref ref) {
  final db = ref.read(appDatabaseProvider);
  final datasource = AuthLocalDatasource(db);
  return AuthRepositoryImpl(datasource);
}

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  Future<UserEntity?> build() async {
    return ref.read(authRepositoryProvider).getCurrentUser();
  }


  Future<void> signInWithPhone(String phoneNumber) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final user = await ref.read(authRepositoryProvider).signInWithPhone(phoneNumber);
      return user;
    });
  }

  Future<void> signInWithGoogle() async {
    debugPrint('[AuthNotifier] signInWithGoogle: setting state to AsyncLoading');
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signInWithGoogle(),
    );
    debugPrint('[AuthNotifier] signInWithGoogle: state updated. hasError: ${state.hasError}, hasValue: ${state.hasValue}');
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    await ref.read(authRepositoryProvider).signOut();
    state = const AsyncData(null);
  }

  Future<bool> authenticateWithBiometric() async {
    return ref.read(authRepositoryProvider).authenticateWithBiometric();
  }

  Future<bool> isBiometricAvailable() async {
    return ref.read(authRepositoryProvider).isBiometricAvailable();
  }
}
