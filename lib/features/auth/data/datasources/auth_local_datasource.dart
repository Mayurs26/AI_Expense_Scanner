import 'package:ai_expense_scanner/core/database/app_database.dart';
import 'package:ai_expense_scanner/features/auth/domain/entities/user_entity.dart';
import 'package:drift/drift.dart';

class AuthLocalDatasource {
  final AppDatabase _db;

  AuthLocalDatasource(this._db);

  Future<void> saveUser(UserEntity user) async {
    await _db.userDao.insertUser(
      UsersCompanion.insert(
        id: user.id,
        displayName: user.displayName,
        email: user.email,
        photoUrl: Value(user.photoUrl),
        createdAt: Value(user.createdAt),
      ),
    );
    await _db.settingsDao.setValue('current_user_id', user.id);
  }

  Future<UserEntity?> getCurrentUser() async {
    final setting = await _db.settingsDao.getValue('current_user_id');
    if (setting == null) return null;
    final user = await _db.userDao.getUserById(setting.value);
    if (user == null) return null;
    return UserEntity(
      id: user.id,
      displayName: user.displayName,
      email: user.email,
      photoUrl: user.photoUrl,
      createdAt: user.createdAt,
    );
  }

  Future<void> clearCurrentUser() async {
    await _db.settingsDao.deleteKey('current_user_id');
  }
}
