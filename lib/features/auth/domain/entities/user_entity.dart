import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
sealed class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String displayName,
    required String email,
    String? photoUrl,
    required DateTime createdAt,
  }) = _UserEntity;
}
