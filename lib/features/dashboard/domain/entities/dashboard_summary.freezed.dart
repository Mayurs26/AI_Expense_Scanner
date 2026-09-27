// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardSummary {
  double get totalSpentThisMonth;
  double get monthlyBudget;
  int get spendingStreak;
  String get streakMessage;
  List<BudgetProgress> get budgetProgress;
  List<ExpenseEntity> get recentExpenses;

  /// Create a copy of DashboardSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardSummaryCopyWith<DashboardSummary> get copyWith =>
      _$DashboardSummaryCopyWithImpl<DashboardSummary>(
          this as DashboardSummary, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardSummary &&
            (identical(other.totalSpentThisMonth, totalSpentThisMonth) ||
                other.totalSpentThisMonth == totalSpentThisMonth) &&
            (identical(other.monthlyBudget, monthlyBudget) ||
                other.monthlyBudget == monthlyBudget) &&
            (identical(other.spendingStreak, spendingStreak) ||
                other.spendingStreak == spendingStreak) &&
            (identical(other.streakMessage, streakMessage) ||
                other.streakMessage == streakMessage) &&
            const DeepCollectionEquality()
                .equals(other.budgetProgress, budgetProgress) &&
            const DeepCollectionEquality()
                .equals(other.recentExpenses, recentExpenses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalSpentThisMonth,
      monthlyBudget,
      spendingStreak,
      streakMessage,
      const DeepCollectionEquality().hash(budgetProgress),
      const DeepCollectionEquality().hash(recentExpenses));

  @override
  String toString() {
    return 'DashboardSummary(totalSpentThisMonth: $totalSpentThisMonth, monthlyBudget: $monthlyBudget, spendingStreak: $spendingStreak, streakMessage: $streakMessage, budgetProgress: $budgetProgress, recentExpenses: $recentExpenses)';
  }
}

/// @nodoc
abstract mixin class $DashboardSummaryCopyWith<$Res> {
  factory $DashboardSummaryCopyWith(
          DashboardSummary value, $Res Function(DashboardSummary) _then) =
      _$DashboardSummaryCopyWithImpl;
  @useResult
  $Res call(
      {double totalSpentThisMonth,
      double monthlyBudget,
      int spendingStreak,
      String streakMessage,
      List<BudgetProgress> budgetProgress,
      List<ExpenseEntity> recentExpenses});
}

/// @nodoc
class _$DashboardSummaryCopyWithImpl<$Res>
    implements $DashboardSummaryCopyWith<$Res> {
  _$DashboardSummaryCopyWithImpl(this._self, this._then);

  final DashboardSummary _self;
  final $Res Function(DashboardSummary) _then;

  /// Create a copy of DashboardSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSpentThisMonth = null,
    Object? monthlyBudget = null,
    Object? spendingStreak = null,
    Object? streakMessage = null,
    Object? budgetProgress = null,
    Object? recentExpenses = null,
  }) {
    return _then(_self.copyWith(
      totalSpentThisMonth: null == totalSpentThisMonth
          ? _self.totalSpentThisMonth
          : totalSpentThisMonth // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyBudget: null == monthlyBudget
          ? _self.monthlyBudget
          : monthlyBudget // ignore: cast_nullable_to_non_nullable
              as double,
      spendingStreak: null == spendingStreak
          ? _self.spendingStreak
          : spendingStreak // ignore: cast_nullable_to_non_nullable
              as int,
      streakMessage: null == streakMessage
          ? _self.streakMessage
          : streakMessage // ignore: cast_nullable_to_non_nullable
              as String,
      budgetProgress: null == budgetProgress
          ? _self.budgetProgress
          : budgetProgress // ignore: cast_nullable_to_non_nullable
              as List<BudgetProgress>,
      recentExpenses: null == recentExpenses
          ? _self.recentExpenses
          : recentExpenses // ignore: cast_nullable_to_non_nullable
              as List<ExpenseEntity>,
    ));
  }
}

/// Adds pattern-matching-related methods to [DashboardSummary].
extension DashboardSummaryPatterns on DashboardSummary {
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
    TResult Function(_DashboardSummary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardSummary() when $default != null:
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
    TResult Function(_DashboardSummary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardSummary():
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
    TResult? Function(_DashboardSummary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardSummary() when $default != null:
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
            double totalSpentThisMonth,
            double monthlyBudget,
            int spendingStreak,
            String streakMessage,
            List<BudgetProgress> budgetProgress,
            List<ExpenseEntity> recentExpenses)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardSummary() when $default != null:
        return $default(
            _that.totalSpentThisMonth,
            _that.monthlyBudget,
            _that.spendingStreak,
            _that.streakMessage,
            _that.budgetProgress,
            _that.recentExpenses);
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
            double totalSpentThisMonth,
            double monthlyBudget,
            int spendingStreak,
            String streakMessage,
            List<BudgetProgress> budgetProgress,
            List<ExpenseEntity> recentExpenses)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardSummary():
        return $default(
            _that.totalSpentThisMonth,
            _that.monthlyBudget,
            _that.spendingStreak,
            _that.streakMessage,
            _that.budgetProgress,
            _that.recentExpenses);
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
            double totalSpentThisMonth,
            double monthlyBudget,
            int spendingStreak,
            String streakMessage,
            List<BudgetProgress> budgetProgress,
            List<ExpenseEntity> recentExpenses)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardSummary() when $default != null:
        return $default(
            _that.totalSpentThisMonth,
            _that.monthlyBudget,
            _that.spendingStreak,
            _that.streakMessage,
            _that.budgetProgress,
            _that.recentExpenses);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DashboardSummary extends DashboardSummary {
  const _DashboardSummary(
      {required this.totalSpentThisMonth,
      required this.monthlyBudget,
      required this.spendingStreak,
      required this.streakMessage,
      required final List<BudgetProgress> budgetProgress,
      required final List<ExpenseEntity> recentExpenses})
      : _budgetProgress = budgetProgress,
        _recentExpenses = recentExpenses,
        super._();

  @override
  final double totalSpentThisMonth;
  @override
  final double monthlyBudget;
  @override
  final int spendingStreak;
  @override
  final String streakMessage;
  final List<BudgetProgress> _budgetProgress;
  @override
  List<BudgetProgress> get budgetProgress {
    if (_budgetProgress is EqualUnmodifiableListView) return _budgetProgress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_budgetProgress);
  }

  final List<ExpenseEntity> _recentExpenses;
  @override
  List<ExpenseEntity> get recentExpenses {
    if (_recentExpenses is EqualUnmodifiableListView) return _recentExpenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentExpenses);
  }

  /// Create a copy of DashboardSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardSummaryCopyWith<_DashboardSummary> get copyWith =>
      __$DashboardSummaryCopyWithImpl<_DashboardSummary>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardSummary &&
            (identical(other.totalSpentThisMonth, totalSpentThisMonth) ||
                other.totalSpentThisMonth == totalSpentThisMonth) &&
            (identical(other.monthlyBudget, monthlyBudget) ||
                other.monthlyBudget == monthlyBudget) &&
            (identical(other.spendingStreak, spendingStreak) ||
                other.spendingStreak == spendingStreak) &&
            (identical(other.streakMessage, streakMessage) ||
                other.streakMessage == streakMessage) &&
            const DeepCollectionEquality()
                .equals(other._budgetProgress, _budgetProgress) &&
            const DeepCollectionEquality()
                .equals(other._recentExpenses, _recentExpenses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalSpentThisMonth,
      monthlyBudget,
      spendingStreak,
      streakMessage,
      const DeepCollectionEquality().hash(_budgetProgress),
      const DeepCollectionEquality().hash(_recentExpenses));

  @override
  String toString() {
    return 'DashboardSummary(totalSpentThisMonth: $totalSpentThisMonth, monthlyBudget: $monthlyBudget, spendingStreak: $spendingStreak, streakMessage: $streakMessage, budgetProgress: $budgetProgress, recentExpenses: $recentExpenses)';
  }
}

/// @nodoc
abstract mixin class _$DashboardSummaryCopyWith<$Res>
    implements $DashboardSummaryCopyWith<$Res> {
  factory _$DashboardSummaryCopyWith(
          _DashboardSummary value, $Res Function(_DashboardSummary) _then) =
      __$DashboardSummaryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double totalSpentThisMonth,
      double monthlyBudget,
      int spendingStreak,
      String streakMessage,
      List<BudgetProgress> budgetProgress,
      List<ExpenseEntity> recentExpenses});
}

/// @nodoc
class __$DashboardSummaryCopyWithImpl<$Res>
    implements _$DashboardSummaryCopyWith<$Res> {
  __$DashboardSummaryCopyWithImpl(this._self, this._then);

  final _DashboardSummary _self;
  final $Res Function(_DashboardSummary) _then;

  /// Create a copy of DashboardSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalSpentThisMonth = null,
    Object? monthlyBudget = null,
    Object? spendingStreak = null,
    Object? streakMessage = null,
    Object? budgetProgress = null,
    Object? recentExpenses = null,
  }) {
    return _then(_DashboardSummary(
      totalSpentThisMonth: null == totalSpentThisMonth
          ? _self.totalSpentThisMonth
          : totalSpentThisMonth // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyBudget: null == monthlyBudget
          ? _self.monthlyBudget
          : monthlyBudget // ignore: cast_nullable_to_non_nullable
              as double,
      spendingStreak: null == spendingStreak
          ? _self.spendingStreak
          : spendingStreak // ignore: cast_nullable_to_non_nullable
              as int,
      streakMessage: null == streakMessage
          ? _self.streakMessage
          : streakMessage // ignore: cast_nullable_to_non_nullable
              as String,
      budgetProgress: null == budgetProgress
          ? _self._budgetProgress
          : budgetProgress // ignore: cast_nullable_to_non_nullable
              as List<BudgetProgress>,
      recentExpenses: null == recentExpenses
          ? _self._recentExpenses
          : recentExpenses // ignore: cast_nullable_to_non_nullable
              as List<ExpenseEntity>,
    ));
  }
}

/// @nodoc
mixin _$BudgetProgress {
  int get categoryId;
  String get categoryName;
  int get categoryColor;
  double get budgetAmount;
  double get spentAmount;

  /// Create a copy of BudgetProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BudgetProgressCopyWith<BudgetProgress> get copyWith =>
      _$BudgetProgressCopyWithImpl<BudgetProgress>(
          this as BudgetProgress, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BudgetProgress &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryColor, categoryColor) ||
                other.categoryColor == categoryColor) &&
            (identical(other.budgetAmount, budgetAmount) ||
                other.budgetAmount == budgetAmount) &&
            (identical(other.spentAmount, spentAmount) ||
                other.spentAmount == spentAmount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId, categoryName,
      categoryColor, budgetAmount, spentAmount);

  @override
  String toString() {
    return 'BudgetProgress(categoryId: $categoryId, categoryName: $categoryName, categoryColor: $categoryColor, budgetAmount: $budgetAmount, spentAmount: $spentAmount)';
  }
}

/// @nodoc
abstract mixin class $BudgetProgressCopyWith<$Res> {
  factory $BudgetProgressCopyWith(
          BudgetProgress value, $Res Function(BudgetProgress) _then) =
      _$BudgetProgressCopyWithImpl;
  @useResult
  $Res call(
      {int categoryId,
      String categoryName,
      int categoryColor,
      double budgetAmount,
      double spentAmount});
}

/// @nodoc
class _$BudgetProgressCopyWithImpl<$Res>
    implements $BudgetProgressCopyWith<$Res> {
  _$BudgetProgressCopyWithImpl(this._self, this._then);

  final BudgetProgress _self;
  final $Res Function(BudgetProgress) _then;

  /// Create a copy of BudgetProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? categoryColor = null,
    Object? budgetAmount = null,
    Object? spentAmount = null,
  }) {
    return _then(_self.copyWith(
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryColor: null == categoryColor
          ? _self.categoryColor
          : categoryColor // ignore: cast_nullable_to_non_nullable
              as int,
      budgetAmount: null == budgetAmount
          ? _self.budgetAmount
          : budgetAmount // ignore: cast_nullable_to_non_nullable
              as double,
      spentAmount: null == spentAmount
          ? _self.spentAmount
          : spentAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [BudgetProgress].
extension BudgetProgressPatterns on BudgetProgress {
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
    TResult Function(_BudgetProgress value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BudgetProgress() when $default != null:
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
    TResult Function(_BudgetProgress value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BudgetProgress():
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
    TResult? Function(_BudgetProgress value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BudgetProgress() when $default != null:
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
    TResult Function(int categoryId, String categoryName, int categoryColor,
            double budgetAmount, double spentAmount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BudgetProgress() when $default != null:
        return $default(_that.categoryId, _that.categoryName,
            _that.categoryColor, _that.budgetAmount, _that.spentAmount);
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
    TResult Function(int categoryId, String categoryName, int categoryColor,
            double budgetAmount, double spentAmount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BudgetProgress():
        return $default(_that.categoryId, _that.categoryName,
            _that.categoryColor, _that.budgetAmount, _that.spentAmount);
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
    TResult? Function(int categoryId, String categoryName, int categoryColor,
            double budgetAmount, double spentAmount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BudgetProgress() when $default != null:
        return $default(_that.categoryId, _that.categoryName,
            _that.categoryColor, _that.budgetAmount, _that.spentAmount);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _BudgetProgress extends BudgetProgress {
  const _BudgetProgress(
      {required this.categoryId,
      required this.categoryName,
      required this.categoryColor,
      required this.budgetAmount,
      required this.spentAmount})
      : super._();

  @override
  final int categoryId;
  @override
  final String categoryName;
  @override
  final int categoryColor;
  @override
  final double budgetAmount;
  @override
  final double spentAmount;

  /// Create a copy of BudgetProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BudgetProgressCopyWith<_BudgetProgress> get copyWith =>
      __$BudgetProgressCopyWithImpl<_BudgetProgress>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BudgetProgress &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryColor, categoryColor) ||
                other.categoryColor == categoryColor) &&
            (identical(other.budgetAmount, budgetAmount) ||
                other.budgetAmount == budgetAmount) &&
            (identical(other.spentAmount, spentAmount) ||
                other.spentAmount == spentAmount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId, categoryName,
      categoryColor, budgetAmount, spentAmount);

  @override
  String toString() {
    return 'BudgetProgress(categoryId: $categoryId, categoryName: $categoryName, categoryColor: $categoryColor, budgetAmount: $budgetAmount, spentAmount: $spentAmount)';
  }
}

/// @nodoc
abstract mixin class _$BudgetProgressCopyWith<$Res>
    implements $BudgetProgressCopyWith<$Res> {
  factory _$BudgetProgressCopyWith(
          _BudgetProgress value, $Res Function(_BudgetProgress) _then) =
      __$BudgetProgressCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int categoryId,
      String categoryName,
      int categoryColor,
      double budgetAmount,
      double spentAmount});
}

/// @nodoc
class __$BudgetProgressCopyWithImpl<$Res>
    implements _$BudgetProgressCopyWith<$Res> {
  __$BudgetProgressCopyWithImpl(this._self, this._then);

  final _BudgetProgress _self;
  final $Res Function(_BudgetProgress) _then;

  /// Create a copy of BudgetProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? categoryColor = null,
    Object? budgetAmount = null,
    Object? spentAmount = null,
  }) {
    return _then(_BudgetProgress(
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryColor: null == categoryColor
          ? _self.categoryColor
          : categoryColor // ignore: cast_nullable_to_non_nullable
              as int,
      budgetAmount: null == budgetAmount
          ? _self.budgetAmount
          : budgetAmount // ignore: cast_nullable_to_non_nullable
              as double,
      spentAmount: null == spentAmount
          ? _self.spentAmount
          : spentAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
