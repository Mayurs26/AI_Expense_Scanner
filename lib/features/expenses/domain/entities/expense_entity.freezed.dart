// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpenseEntity {
  int? get id;
  String get userId;
  String get storeName;
  double get totalAmount;
  double? get gstAmount;
  int get categoryId;
  String? get categoryName;
  int? get categoryColor;
  DateTime get date;
  String? get receiptNumber;
  String? get imagePath;
  String? get paymentMethod;
  String? get notes;
  String? get tags;
  bool get isDuplicateFlagged;
  DateTime get createdAt;
  DateTime get updatedAt;
  List<ExpenseItemEntity> get items;

  /// Create a copy of ExpenseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExpenseEntityCopyWith<ExpenseEntity> get copyWith =>
      _$ExpenseEntityCopyWithImpl<ExpenseEntity>(
          this as ExpenseEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExpenseEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.gstAmount, gstAmount) ||
                other.gstAmount == gstAmount) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryColor, categoryColor) ||
                other.categoryColor == categoryColor) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.receiptNumber, receiptNumber) ||
                other.receiptNumber == receiptNumber) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.tags, tags) || other.tags == tags) &&
            (identical(other.isDuplicateFlagged, isDuplicateFlagged) ||
                other.isDuplicateFlagged == isDuplicateFlagged) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      storeName,
      totalAmount,
      gstAmount,
      categoryId,
      categoryName,
      categoryColor,
      date,
      receiptNumber,
      imagePath,
      paymentMethod,
      notes,
      tags,
      isDuplicateFlagged,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'ExpenseEntity(id: $id, userId: $userId, storeName: $storeName, totalAmount: $totalAmount, gstAmount: $gstAmount, categoryId: $categoryId, categoryName: $categoryName, categoryColor: $categoryColor, date: $date, receiptNumber: $receiptNumber, imagePath: $imagePath, paymentMethod: $paymentMethod, notes: $notes, tags: $tags, isDuplicateFlagged: $isDuplicateFlagged, createdAt: $createdAt, updatedAt: $updatedAt, items: $items)';
  }
}

/// @nodoc
abstract mixin class $ExpenseEntityCopyWith<$Res> {
  factory $ExpenseEntityCopyWith(
          ExpenseEntity value, $Res Function(ExpenseEntity) _then) =
      _$ExpenseEntityCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String userId,
      String storeName,
      double totalAmount,
      double? gstAmount,
      int categoryId,
      String? categoryName,
      int? categoryColor,
      DateTime date,
      String? receiptNumber,
      String? imagePath,
      String? paymentMethod,
      String? notes,
      String? tags,
      bool isDuplicateFlagged,
      DateTime createdAt,
      DateTime updatedAt,
      List<ExpenseItemEntity> items});
}

/// @nodoc
class _$ExpenseEntityCopyWithImpl<$Res>
    implements $ExpenseEntityCopyWith<$Res> {
  _$ExpenseEntityCopyWithImpl(this._self, this._then);

  final ExpenseEntity _self;
  final $Res Function(ExpenseEntity) _then;

  /// Create a copy of ExpenseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? storeName = null,
    Object? totalAmount = null,
    Object? gstAmount = freezed,
    Object? categoryId = null,
    Object? categoryName = freezed,
    Object? categoryColor = freezed,
    Object? date = null,
    Object? receiptNumber = freezed,
    Object? imagePath = freezed,
    Object? paymentMethod = freezed,
    Object? notes = freezed,
    Object? tags = freezed,
    Object? isDuplicateFlagged = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _self.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      gstAmount: freezed == gstAmount
          ? _self.gstAmount
          : gstAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: freezed == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryColor: freezed == categoryColor
          ? _self.categoryColor
          : categoryColor // ignore: cast_nullable_to_non_nullable
              as int?,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      receiptNumber: freezed == receiptNumber
          ? _self.receiptNumber
          : receiptNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      isDuplicateFlagged: null == isDuplicateFlagged
          ? _self.isDuplicateFlagged
          : isDuplicateFlagged // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ExpenseItemEntity>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ExpenseEntity].
extension ExpenseEntityPatterns on ExpenseEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ExpenseEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExpenseEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ExpenseEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseEntity():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ExpenseEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int? id,
            String userId,
            String storeName,
            double totalAmount,
            double? gstAmount,
            int categoryId,
            String? categoryName,
            int? categoryColor,
            DateTime date,
            String? receiptNumber,
            String? imagePath,
            String? paymentMethod,
            String? notes,
            String? tags,
            bool isDuplicateFlagged,
            DateTime createdAt,
            DateTime updatedAt,
            List<ExpenseItemEntity> items)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExpenseEntity() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.storeName,
            _that.totalAmount,
            _that.gstAmount,
            _that.categoryId,
            _that.categoryName,
            _that.categoryColor,
            _that.date,
            _that.receiptNumber,
            _that.imagePath,
            _that.paymentMethod,
            _that.notes,
            _that.tags,
            _that.isDuplicateFlagged,
            _that.createdAt,
            _that.updatedAt,
            _that.items);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int? id,
            String userId,
            String storeName,
            double totalAmount,
            double? gstAmount,
            int categoryId,
            String? categoryName,
            int? categoryColor,
            DateTime date,
            String? receiptNumber,
            String? imagePath,
            String? paymentMethod,
            String? notes,
            String? tags,
            bool isDuplicateFlagged,
            DateTime createdAt,
            DateTime updatedAt,
            List<ExpenseItemEntity> items)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseEntity():
        return $default(
            _that.id,
            _that.userId,
            _that.storeName,
            _that.totalAmount,
            _that.gstAmount,
            _that.categoryId,
            _that.categoryName,
            _that.categoryColor,
            _that.date,
            _that.receiptNumber,
            _that.imagePath,
            _that.paymentMethod,
            _that.notes,
            _that.tags,
            _that.isDuplicateFlagged,
            _that.createdAt,
            _that.updatedAt,
            _that.items);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int? id,
            String userId,
            String storeName,
            double totalAmount,
            double? gstAmount,
            int categoryId,
            String? categoryName,
            int? categoryColor,
            DateTime date,
            String? receiptNumber,
            String? imagePath,
            String? paymentMethod,
            String? notes,
            String? tags,
            bool isDuplicateFlagged,
            DateTime createdAt,
            DateTime updatedAt,
            List<ExpenseItemEntity> items)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseEntity() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.storeName,
            _that.totalAmount,
            _that.gstAmount,
            _that.categoryId,
            _that.categoryName,
            _that.categoryColor,
            _that.date,
            _that.receiptNumber,
            _that.imagePath,
            _that.paymentMethod,
            _that.notes,
            _that.tags,
            _that.isDuplicateFlagged,
            _that.createdAt,
            _that.updatedAt,
            _that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ExpenseEntity implements ExpenseEntity {
  const _ExpenseEntity(
      {this.id,
      required this.userId,
      required this.storeName,
      required this.totalAmount,
      this.gstAmount,
      required this.categoryId,
      this.categoryName,
      this.categoryColor,
      required this.date,
      this.receiptNumber,
      this.imagePath,
      this.paymentMethod,
      this.notes,
      this.tags,
      this.isDuplicateFlagged = false,
      required this.createdAt,
      required this.updatedAt,
      final List<ExpenseItemEntity> items = const []})
      : _items = items;

  @override
  final int? id;
  @override
  final String userId;
  @override
  final String storeName;
  @override
  final double totalAmount;
  @override
  final double? gstAmount;
  @override
  final int categoryId;
  @override
  final String? categoryName;
  @override
  final int? categoryColor;
  @override
  final DateTime date;
  @override
  final String? receiptNumber;
  @override
  final String? imagePath;
  @override
  final String? paymentMethod;
  @override
  final String? notes;
  @override
  final String? tags;
  @override
  @JsonKey()
  final bool isDuplicateFlagged;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  final List<ExpenseItemEntity> _items;
  @override
  @JsonKey()
  List<ExpenseItemEntity> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of ExpenseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExpenseEntityCopyWith<_ExpenseEntity> get copyWith =>
      __$ExpenseEntityCopyWithImpl<_ExpenseEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExpenseEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.gstAmount, gstAmount) ||
                other.gstAmount == gstAmount) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryColor, categoryColor) ||
                other.categoryColor == categoryColor) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.receiptNumber, receiptNumber) ||
                other.receiptNumber == receiptNumber) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.tags, tags) || other.tags == tags) &&
            (identical(other.isDuplicateFlagged, isDuplicateFlagged) ||
                other.isDuplicateFlagged == isDuplicateFlagged) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      storeName,
      totalAmount,
      gstAmount,
      categoryId,
      categoryName,
      categoryColor,
      date,
      receiptNumber,
      imagePath,
      paymentMethod,
      notes,
      tags,
      isDuplicateFlagged,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'ExpenseEntity(id: $id, userId: $userId, storeName: $storeName, totalAmount: $totalAmount, gstAmount: $gstAmount, categoryId: $categoryId, categoryName: $categoryName, categoryColor: $categoryColor, date: $date, receiptNumber: $receiptNumber, imagePath: $imagePath, paymentMethod: $paymentMethod, notes: $notes, tags: $tags, isDuplicateFlagged: $isDuplicateFlagged, createdAt: $createdAt, updatedAt: $updatedAt, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$ExpenseEntityCopyWith<$Res>
    implements $ExpenseEntityCopyWith<$Res> {
  factory _$ExpenseEntityCopyWith(
          _ExpenseEntity value, $Res Function(_ExpenseEntity) _then) =
      __$ExpenseEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String userId,
      String storeName,
      double totalAmount,
      double? gstAmount,
      int categoryId,
      String? categoryName,
      int? categoryColor,
      DateTime date,
      String? receiptNumber,
      String? imagePath,
      String? paymentMethod,
      String? notes,
      String? tags,
      bool isDuplicateFlagged,
      DateTime createdAt,
      DateTime updatedAt,
      List<ExpenseItemEntity> items});
}

/// @nodoc
class __$ExpenseEntityCopyWithImpl<$Res>
    implements _$ExpenseEntityCopyWith<$Res> {
  __$ExpenseEntityCopyWithImpl(this._self, this._then);

  final _ExpenseEntity _self;
  final $Res Function(_ExpenseEntity) _then;

  /// Create a copy of ExpenseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? storeName = null,
    Object? totalAmount = null,
    Object? gstAmount = freezed,
    Object? categoryId = null,
    Object? categoryName = freezed,
    Object? categoryColor = freezed,
    Object? date = null,
    Object? receiptNumber = freezed,
    Object? imagePath = freezed,
    Object? paymentMethod = freezed,
    Object? notes = freezed,
    Object? tags = freezed,
    Object? isDuplicateFlagged = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? items = null,
  }) {
    return _then(_ExpenseEntity(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _self.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      gstAmount: freezed == gstAmount
          ? _self.gstAmount
          : gstAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: freezed == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryColor: freezed == categoryColor
          ? _self.categoryColor
          : categoryColor // ignore: cast_nullable_to_non_nullable
              as int?,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      receiptNumber: freezed == receiptNumber
          ? _self.receiptNumber
          : receiptNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      isDuplicateFlagged: null == isDuplicateFlagged
          ? _self.isDuplicateFlagged
          : isDuplicateFlagged // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ExpenseItemEntity>,
    ));
  }
}

/// @nodoc
mixin _$ExpenseItemEntity {
  int? get id;
  int get expenseId;
  String get itemName;
  double get price;

  /// Create a copy of ExpenseItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExpenseItemEntityCopyWith<ExpenseItemEntity> get copyWith =>
      _$ExpenseItemEntityCopyWithImpl<ExpenseItemEntity>(
          this as ExpenseItemEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExpenseItemEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.expenseId, expenseId) ||
                other.expenseId == expenseId) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, expenseId, itemName, price);

  @override
  String toString() {
    return 'ExpenseItemEntity(id: $id, expenseId: $expenseId, itemName: $itemName, price: $price)';
  }
}

/// @nodoc
abstract mixin class $ExpenseItemEntityCopyWith<$Res> {
  factory $ExpenseItemEntityCopyWith(
          ExpenseItemEntity value, $Res Function(ExpenseItemEntity) _then) =
      _$ExpenseItemEntityCopyWithImpl;
  @useResult
  $Res call({int? id, int expenseId, String itemName, double price});
}

/// @nodoc
class _$ExpenseItemEntityCopyWithImpl<$Res>
    implements $ExpenseItemEntityCopyWith<$Res> {
  _$ExpenseItemEntityCopyWithImpl(this._self, this._then);

  final ExpenseItemEntity _self;
  final $Res Function(ExpenseItemEntity) _then;

  /// Create a copy of ExpenseItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? expenseId = null,
    Object? itemName = null,
    Object? price = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      expenseId: null == expenseId
          ? _self.expenseId
          : expenseId // ignore: cast_nullable_to_non_nullable
              as int,
      itemName: null == itemName
          ? _self.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [ExpenseItemEntity].
extension ExpenseItemEntityPatterns on ExpenseItemEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ExpenseItemEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExpenseItemEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ExpenseItemEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseItemEntity():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ExpenseItemEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseItemEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int? id, int expenseId, String itemName, double price)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExpenseItemEntity() when $default != null:
        return $default(_that.id, _that.expenseId, _that.itemName, _that.price);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int? id, int expenseId, String itemName, double price)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseItemEntity():
        return $default(_that.id, _that.expenseId, _that.itemName, _that.price);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int? id, int expenseId, String itemName, double price)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExpenseItemEntity() when $default != null:
        return $default(_that.id, _that.expenseId, _that.itemName, _that.price);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ExpenseItemEntity implements ExpenseItemEntity {
  const _ExpenseItemEntity(
      {this.id,
      required this.expenseId,
      required this.itemName,
      required this.price});

  @override
  final int? id;
  @override
  final int expenseId;
  @override
  final String itemName;
  @override
  final double price;

  /// Create a copy of ExpenseItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExpenseItemEntityCopyWith<_ExpenseItemEntity> get copyWith =>
      __$ExpenseItemEntityCopyWithImpl<_ExpenseItemEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExpenseItemEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.expenseId, expenseId) ||
                other.expenseId == expenseId) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, expenseId, itemName, price);

  @override
  String toString() {
    return 'ExpenseItemEntity(id: $id, expenseId: $expenseId, itemName: $itemName, price: $price)';
  }
}

/// @nodoc
abstract mixin class _$ExpenseItemEntityCopyWith<$Res>
    implements $ExpenseItemEntityCopyWith<$Res> {
  factory _$ExpenseItemEntityCopyWith(
          _ExpenseItemEntity value, $Res Function(_ExpenseItemEntity) _then) =
      __$ExpenseItemEntityCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, int expenseId, String itemName, double price});
}

/// @nodoc
class __$ExpenseItemEntityCopyWithImpl<$Res>
    implements _$ExpenseItemEntityCopyWith<$Res> {
  __$ExpenseItemEntityCopyWithImpl(this._self, this._then);

  final _ExpenseItemEntity _self;
  final $Res Function(_ExpenseItemEntity) _then;

  /// Create a copy of ExpenseItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? expenseId = null,
    Object? itemName = null,
    Object? price = null,
  }) {
    return _then(_ExpenseItemEntity(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      expenseId: null == expenseId
          ? _self.expenseId
          : expenseId // ignore: cast_nullable_to_non_nullable
              as int,
      itemName: null == itemName
          ? _self.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
