import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:local_auth/local_auth.dart';
import 'package:ai_expense_scanner/core/errors/exceptions.dart';
import 'package:ai_expense_scanner/features/auth/domain/entities/user_entity.dart';
import 'package:ai_expense_scanner/features/auth/domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource _localDatasource;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );
  final LocalAuthentication _localAuth = LocalAuthentication();

  AuthRepositoryImpl(this._localDatasource);

  @override
  Future<UserEntity?> getCurrentUser() async {
    try {
      return await _localDatasource.getCurrentUser();
    } catch (e) {
      throw AuthException('Failed to get current user: $e');
    }
  }

  @override
  Future<UserEntity> signInWithGoogle() async {
    debugPrint('[Auth] signInWithGoogle: Starting');
    try {
      final googleUser = await _googleSignIn.signIn();
      debugPrint('[Auth] signInWithGoogle: _googleSignIn.signIn() completed');
      if (googleUser == null) {
        debugPrint('[Auth] signInWithGoogle: user cancelled');
        throw const AuthException('Sign in cancelled by user');
      }

      debugPrint('[Auth] signInWithGoogle: Google user retrieved: ${googleUser.id}');

      final user = UserEntity(
        id: googleUser.id,
        displayName: googleUser.displayName ?? 'User',
        email: googleUser.email,
        photoUrl: googleUser.photoUrl,
        createdAt: DateTime.now(),
      );

      debugPrint('[Auth] signInWithGoogle: Saving user to SQLite...');
      await _localDatasource.saveUser(user);
      debugPrint('[Auth] signInWithGoogle: User saved to SQLite successfully');
      return user;
    } on AuthException {
      rethrow;
    } catch (e) {
      debugPrint('[Auth] signInWithGoogle: Error: $e');
      
      // Fallback for local development when Firebase/SHA-1 is not configured.
      // If sign in reached the account picker before failing server validation,
      // _googleSignIn.currentUser will still hold the real Google account details!
      final currentUser = _googleSignIn.currentUser;
      
      debugPrint('[Auth] signInWithGoogle: Falling back to local user due to server validation failure. currentUser: ${currentUser?.email}');
      
      final mockUser = UserEntity(
        id: currentUser?.id ?? 'local_mock_user_123',
        displayName: currentUser?.displayName ?? 'Local User',
        email: currentUser?.email ?? 'local.user@example.com',
        photoUrl: currentUser?.photoUrl,
        createdAt: DateTime.now(),
      );
      
      await _localDatasource.saveUser(mockUser);
      return mockUser;
    }
  }


  @override
  Future<UserEntity> signInWithPhone(String phoneNumber) async {
    try {
      debugPrint('[Auth] signInWithPhone: Falling back to local mock user due to offline-first');
      final mockUser = UserEntity(
        id: 'phone_',
        displayName: 'Phone User',
        email: phoneNumber, // Use email field to store phone number for offline mock
        photoUrl: null,
        createdAt: DateTime.now(),
      );
      
      await _localDatasource.saveUser(mockUser);
      return mockUser;
    } catch (e) {
      throw const AuthException('Failed to sign in with phone.');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _localDatasource.clearCurrentUser();
    } catch (e) {
      throw AuthException('Sign out failed: $e');
    }
  }

  @override
  Future<bool> isBiometricAvailable() async {
    try {
      final canCheck = await _localAuth.canCheckBiometrics;
      final isDeviceSupported = await _localAuth.isDeviceSupported();
      return canCheck && isDeviceSupported;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> authenticateWithBiometric() async {
    try {
      return await _localAuth.authenticate(
        localizedReason: 'Authenticate to access AI Expense Scanner',
        options: const AuthenticationOptions(
          biometricOnly: false,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      throw AuthException('Biometric authentication failed: $e');
    }
  }
}
