import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_entity.freezed.dart';

@freezed
sealed class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    required int id,
    required String name,
    required String icon,
    required int color,
    @Default(false) bool isCustom,
  }) = _CategoryEntity;
}
