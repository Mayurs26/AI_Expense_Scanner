import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> getCurrentUser();
  Future<UserEntity> signInWithGoogle();
  Future<UserEntity> signInWithPhone(String phoneNumber);
  Future<void> signOut();
  Future<bool> isBiometricAvailable();
  Future<bool> authenticateWithBiometric();
}
