import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_entity.freezed.dart';

@freezed
sealed class ExpenseEntity with _$ExpenseEntity {
  const factory ExpenseEntity({
    int? id,
    required String userId,
    required String storeName,
    required double totalAmount,
    double? gstAmount,
    required int categoryId,
    String? categoryName,
    int? categoryColor,
    required DateTime date,
    String? receiptNumber,
    String? imagePath,
    String? paymentMethod,
    String? notes,
    String? tags,
    @Default(false) bool isDuplicateFlagged,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default([]) List<ExpenseItemEntity> items,
  }) = _ExpenseEntity;
}

@freezed
sealed class ExpenseItemEntity with _$ExpenseItemEntity {
  const factory ExpenseItemEntity({
    int? id,
    required int expenseId,
    required String itemName,
    required double price,
  }) = _ExpenseItemEntity;
}
