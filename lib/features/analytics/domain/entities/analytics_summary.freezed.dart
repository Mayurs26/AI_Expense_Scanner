// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnalyticsSummary {
  List<CategorySpend> get categoryBreakdown;
  List<WeeklySpend> get weeklySpending;
  List<MonthlySpend> get monthlyTrend;
  List<CategorySpend> get topCategories;

  /// Create a copy of AnalyticsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AnalyticsSummaryCopyWith<AnalyticsSummary> get copyWith =>
      _$AnalyticsSummaryCopyWithImpl<AnalyticsSummary>(
          this as AnalyticsSummary, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AnalyticsSummary &&
            const DeepCollectionEquality()
                .equals(other.categoryBreakdown, categoryBreakdown) &&
            const DeepCollectionEquality()
                .equals(other.weeklySpending, weeklySpending) &&
            const DeepCollectionEquality()
                .equals(other.monthlyTrend, monthlyTrend) &&
            const DeepCollectionEquality()
                .equals(other.topCategories, topCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categoryBreakdown),
      const DeepCollectionEquality().hash(weeklySpending),
      const DeepCollectionEquality().hash(monthlyTrend),
      const DeepCollectionEquality().hash(topCategories));

  @override
  String toString() {
    return 'AnalyticsSummary(categoryBreakdown: $categoryBreakdown, weeklySpending: $weeklySpending, monthlyTrend: $monthlyTrend, topCategories: $topCategories)';
  }
}

/// @nodoc
abstract mixin class $AnalyticsSummaryCopyWith<$Res> {
  factory $AnalyticsSummaryCopyWith(
          AnalyticsSummary value, $Res Function(AnalyticsSummary) _then) =
      _$AnalyticsSummaryCopyWithImpl;
  @useResult
  $Res call(
      {List<CategorySpend> categoryBreakdown,
      List<WeeklySpend> weeklySpending,
      List<MonthlySpend> monthlyTrend,
      List<CategorySpend> topCategories});
}

/// @nodoc
class _$AnalyticsSummaryCopyWithImpl<$Res>
    implements $AnalyticsSummaryCopyWith<$Res> {
  _$AnalyticsSummaryCopyWithImpl(this._self, this._then);

  final AnalyticsSummary _self;
  final $Res Function(AnalyticsSummary) _then;

  /// Create a copy of AnalyticsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryBreakdown = null,
    Object? weeklySpending = null,
    Object? monthlyTrend = null,
    Object? topCategories = null,
  }) {
    return _then(_self.copyWith(
      categoryBreakdown: null == categoryBreakdown
          ? _self.categoryBreakdown
          : categoryBreakdown // ignore: cast_nullable_to_non_nullable
              as List<CategorySpend>,
      weeklySpending: null == weeklySpending
          ? _self.weeklySpending
          : weeklySpending // ignore: cast_nullable_to_non_nullable
              as List<WeeklySpend>,
      monthlyTrend: null == monthlyTrend
          ? _self.monthlyTrend
          : monthlyTrend // ignore: cast_nullable_to_non_nullable
              as List<MonthlySpend>,
      topCategories: null == topCategories
          ? _self.topCategories
          : topCategories // ignore: cast_nullable_to_non_nullable
              as List<CategorySpend>,
    ));
  }
}

/// Adds pattern-matching-related methods to [AnalyticsSummary].
extension AnalyticsSummaryPatterns on AnalyticsSummary {
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
    TResult Function(_AnalyticsSummary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AnalyticsSummary() when $default != null:
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
    TResult Function(_AnalyticsSummary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsSummary():
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
    TResult? Function(_AnalyticsSummary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsSummary() when $default != null:
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
            List<CategorySpend> categoryBreakdown,
            List<WeeklySpend> weeklySpending,
            List<MonthlySpend> monthlyTrend,
            List<CategorySpend> topCategories)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AnalyticsSummary() when $default != null:
        return $default(_that.categoryBreakdown, _that.weeklySpending,
            _that.monthlyTrend, _that.topCategories);
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
            List<CategorySpend> categoryBreakdown,
            List<WeeklySpend> weeklySpending,
            List<MonthlySpend> monthlyTrend,
            List<CategorySpend> topCategories)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsSummary():
        return $default(_that.categoryBreakdown, _that.weeklySpending,
            _that.monthlyTrend, _that.topCategories);
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
            List<CategorySpend> categoryBreakdown,
            List<WeeklySpend> weeklySpending,
            List<MonthlySpend> monthlyTrend,
            List<CategorySpend> topCategories)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnalyticsSummary() when $default != null:
        return $default(_that.categoryBreakdown, _that.weeklySpending,
            _that.monthlyTrend, _that.topCategories);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AnalyticsSummary implements AnalyticsSummary {
  const _AnalyticsSummary(
      {required final List<CategorySpend> categoryBreakdown,
      required final List<WeeklySpend> weeklySpending,
      required final List<MonthlySpend> monthlyTrend,
      required final List<CategorySpend> topCategories})
      : _categoryBreakdown = categoryBreakdown,
        _weeklySpending = weeklySpending,
        _monthlyTrend = monthlyTrend,
        _topCategories = topCategories;

  final List<CategorySpend> _categoryBreakdown;
  @override
  List<CategorySpend> get categoryBreakdown {
    if (_categoryBreakdown is EqualUnmodifiableListView)
      return _categoryBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryBreakdown);
  }

  final List<WeeklySpend> _weeklySpending;
  @override
  List<WeeklySpend> get weeklySpending {
    if (_weeklySpending is EqualUnmodifiableListView) return _weeklySpending;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklySpending);
  }

  final List<MonthlySpend> _monthlyTrend;
  @override
  List<MonthlySpend> get monthlyTrend {
    if (_monthlyTrend is EqualUnmodifiableListView) return _monthlyTrend;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthlyTrend);
  }

  final List<CategorySpend> _topCategories;
  @override
  List<CategorySpend> get topCategories {
    if (_topCategories is EqualUnmodifiableListView) return _topCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topCategories);
  }

  /// Create a copy of AnalyticsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AnalyticsSummaryCopyWith<_AnalyticsSummary> get copyWith =>
      __$AnalyticsSummaryCopyWithImpl<_AnalyticsSummary>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnalyticsSummary &&
            const DeepCollectionEquality()
                .equals(other._categoryBreakdown, _categoryBreakdown) &&
            const DeepCollectionEquality()
                .equals(other._weeklySpending, _weeklySpending) &&
            const DeepCollectionEquality()
                .equals(other._monthlyTrend, _monthlyTrend) &&
            const DeepCollectionEquality()
                .equals(other._topCategories, _topCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categoryBreakdown),
      const DeepCollectionEquality().hash(_weeklySpending),
      const DeepCollectionEquality().hash(_monthlyTrend),
      const DeepCollectionEquality().hash(_topCategories));

  @override
  String toString() {
    return 'AnalyticsSummary(categoryBreakdown: $categoryBreakdown, weeklySpending: $weeklySpending, monthlyTrend: $monthlyTrend, topCategories: $topCategories)';
  }
}

/// @nodoc
abstract mixin class _$AnalyticsSummaryCopyWith<$Res>
    implements $AnalyticsSummaryCopyWith<$Res> {
  factory _$AnalyticsSummaryCopyWith(
          _AnalyticsSummary value, $Res Function(_AnalyticsSummary) _then) =
      __$AnalyticsSummaryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<CategorySpend> categoryBreakdown,
      List<WeeklySpend> weeklySpending,
      List<MonthlySpend> monthlyTrend,
      List<CategorySpend> topCategories});
}

/// @nodoc
class __$AnalyticsSummaryCopyWithImpl<$Res>
    implements _$AnalyticsSummaryCopyWith<$Res> {
  __$AnalyticsSummaryCopyWithImpl(this._self, this._then);

  final _AnalyticsSummary _self;
  final $Res Function(_AnalyticsSummary) _then;

  /// Create a copy of AnalyticsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categoryBreakdown = null,
    Object? weeklySpending = null,
    Object? monthlyTrend = null,
    Object? topCategories = null,
  }) {
    return _then(_AnalyticsSummary(
      categoryBreakdown: null == categoryBreakdown
          ? _self._categoryBreakdown
          : categoryBreakdown // ignore: cast_nullable_to_non_nullable
              as List<CategorySpend>,
      weeklySpending: null == weeklySpending
          ? _self._weeklySpending
          : weeklySpending // ignore: cast_nullable_to_non_nullable
              as List<WeeklySpend>,
      monthlyTrend: null == monthlyTrend
          ? _self._monthlyTrend
          : monthlyTrend // ignore: cast_nullable_to_non_nullable
              as List<MonthlySpend>,
      topCategories: null == topCategories
          ? _self._topCategories
          : topCategories // ignore: cast_nullable_to_non_nullable
              as List<CategorySpend>,
    ));
  }
}

/// @nodoc
mixin _$CategorySpend {
  int get categoryId;
  String get categoryName;
  int get categoryColor;
  double get amount;
  double get percentage;

  /// Create a copy of CategorySpend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategorySpendCopyWith<CategorySpend> get copyWith =>
      _$CategorySpendCopyWithImpl<CategorySpend>(
          this as CategorySpend, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategorySpend &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryColor, categoryColor) ||
                other.categoryColor == categoryColor) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, categoryId, categoryName, categoryColor, amount, percentage);

  @override
  String toString() {
    return 'CategorySpend(categoryId: $categoryId, categoryName: $categoryName, categoryColor: $categoryColor, amount: $amount, percentage: $percentage)';
  }
}

/// @nodoc
abstract mixin class $CategorySpendCopyWith<$Res> {
  factory $CategorySpendCopyWith(
          CategorySpend value, $Res Function(CategorySpend) _then) =
      _$CategorySpendCopyWithImpl;
  @useResult
  $Res call(
      {int categoryId,
      String categoryName,
      int categoryColor,
      double amount,
      double percentage});
}

/// @nodoc
class _$CategorySpendCopyWithImpl<$Res>
    implements $CategorySpendCopyWith<$Res> {
  _$CategorySpendCopyWithImpl(this._self, this._then);

  final CategorySpend _self;
  final $Res Function(CategorySpend) _then;

  /// Create a copy of CategorySpend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? categoryColor = null,
    Object? amount = null,
    Object? percentage = null,
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
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [CategorySpend].
extension CategorySpendPatterns on CategorySpend {
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
    TResult Function(_CategorySpend value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategorySpend() when $default != null:
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
    TResult Function(_CategorySpend value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategorySpend():
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
    TResult? Function(_CategorySpend value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategorySpend() when $default != null:
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
            double amount, double percentage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategorySpend() when $default != null:
        return $default(_that.categoryId, _that.categoryName,
            _that.categoryColor, _that.amount, _that.percentage);
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
            double amount, double percentage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategorySpend():
        return $default(_that.categoryId, _that.categoryName,
            _that.categoryColor, _that.amount, _that.percentage);
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
            double amount, double percentage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategorySpend() when $default != null:
        return $default(_that.categoryId, _that.categoryName,
            _that.categoryColor, _that.amount, _that.percentage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CategorySpend implements CategorySpend {
  const _CategorySpend(
      {required this.categoryId,
      required this.categoryName,
      required this.categoryColor,
      required this.amount,
      required this.percentage});

  @override
  final int categoryId;
  @override
  final String categoryName;
  @override
  final int categoryColor;
  @override
  final double amount;
  @override
  final double percentage;

  /// Create a copy of CategorySpend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategorySpendCopyWith<_CategorySpend> get copyWith =>
      __$CategorySpendCopyWithImpl<_CategorySpend>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategorySpend &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryColor, categoryColor) ||
                other.categoryColor == categoryColor) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, categoryId, categoryName, categoryColor, amount, percentage);

  @override
  String toString() {
    return 'CategorySpend(categoryId: $categoryId, categoryName: $categoryName, categoryColor: $categoryColor, amount: $amount, percentage: $percentage)';
  }
}

/// @nodoc
abstract mixin class _$CategorySpendCopyWith<$Res>
    implements $CategorySpendCopyWith<$Res> {
  factory _$CategorySpendCopyWith(
          _CategorySpend value, $Res Function(_CategorySpend) _then) =
      __$CategorySpendCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int categoryId,
      String categoryName,
      int categoryColor,
      double amount,
      double percentage});
}

/// @nodoc
class __$CategorySpendCopyWithImpl<$Res>
    implements _$CategorySpendCopyWith<$Res> {
  __$CategorySpendCopyWithImpl(this._self, this._then);

  final _CategorySpend _self;
  final $Res Function(_CategorySpend) _then;

  /// Create a copy of CategorySpend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? categoryColor = null,
    Object? amount = null,
    Object? percentage = null,
  }) {
    return _then(_CategorySpend(
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
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$WeeklySpend {
  String get dayLabel;
  double get amount;
  DateTime get date;

  /// Create a copy of WeeklySpend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeeklySpendCopyWith<WeeklySpend> get copyWith =>
      _$WeeklySpendCopyWithImpl<WeeklySpend>(this as WeeklySpend, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeeklySpend &&
            (identical(other.dayLabel, dayLabel) ||
                other.dayLabel == dayLabel) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dayLabel, amount, date);

  @override
  String toString() {
    return 'WeeklySpend(dayLabel: $dayLabel, amount: $amount, date: $date)';
  }
}

/// @nodoc
abstract mixin class $WeeklySpendCopyWith<$Res> {
  factory $WeeklySpendCopyWith(
          WeeklySpend value, $Res Function(WeeklySpend) _then) =
      _$WeeklySpendCopyWithImpl;
  @useResult
  $Res call({String dayLabel, double amount, DateTime date});
}

/// @nodoc
class _$WeeklySpendCopyWithImpl<$Res> implements $WeeklySpendCopyWith<$Res> {
  _$WeeklySpendCopyWithImpl(this._self, this._then);

  final WeeklySpend _self;
  final $Res Function(WeeklySpend) _then;

  /// Create a copy of WeeklySpend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayLabel = null,
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_self.copyWith(
      dayLabel: null == dayLabel
          ? _self.dayLabel
          : dayLabel // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [WeeklySpend].
extension WeeklySpendPatterns on WeeklySpend {
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
    TResult Function(_WeeklySpend value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WeeklySpend() when $default != null:
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
    TResult Function(_WeeklySpend value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeeklySpend():
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
    TResult? Function(_WeeklySpend value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeeklySpend() when $default != null:
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
    TResult Function(String dayLabel, double amount, DateTime date)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WeeklySpend() when $default != null:
        return $default(_that.dayLabel, _that.amount, _that.date);
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
    TResult Function(String dayLabel, double amount, DateTime date) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeeklySpend():
        return $default(_that.dayLabel, _that.amount, _that.date);
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
    TResult? Function(String dayLabel, double amount, DateTime date)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeeklySpend() when $default != null:
        return $default(_that.dayLabel, _that.amount, _that.date);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WeeklySpend implements WeeklySpend {
  const _WeeklySpend(
      {required this.dayLabel, required this.amount, required this.date});

  @override
  final String dayLabel;
  @override
  final double amount;
  @override
  final DateTime date;

  /// Create a copy of WeeklySpend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeeklySpendCopyWith<_WeeklySpend> get copyWith =>
      __$WeeklySpendCopyWithImpl<_WeeklySpend>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeeklySpend &&
            (identical(other.dayLabel, dayLabel) ||
                other.dayLabel == dayLabel) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dayLabel, amount, date);

  @override
  String toString() {
    return 'WeeklySpend(dayLabel: $dayLabel, amount: $amount, date: $date)';
  }
}

/// @nodoc
abstract mixin class _$WeeklySpendCopyWith<$Res>
    implements $WeeklySpendCopyWith<$Res> {
  factory _$WeeklySpendCopyWith(
          _WeeklySpend value, $Res Function(_WeeklySpend) _then) =
      __$WeeklySpendCopyWithImpl;
  @override
  @useResult
  $Res call({String dayLabel, double amount, DateTime date});
}

/// @nodoc
class __$WeeklySpendCopyWithImpl<$Res> implements _$WeeklySpendCopyWith<$Res> {
  __$WeeklySpendCopyWithImpl(this._self, this._then);

  final _WeeklySpend _self;
  final $Res Function(_WeeklySpend) _then;

  /// Create a copy of WeeklySpend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dayLabel = null,
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_WeeklySpend(
      dayLabel: null == dayLabel
          ? _self.dayLabel
          : dayLabel // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$MonthlySpend {
  String get monthLabel;
  double get amount;
  int get month;
  int get year;

  /// Create a copy of MonthlySpend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MonthlySpendCopyWith<MonthlySpend> get copyWith =>
      _$MonthlySpendCopyWithImpl<MonthlySpend>(
          this as MonthlySpend, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MonthlySpend &&
            (identical(other.monthLabel, monthLabel) ||
                other.monthLabel == monthLabel) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year));
  }

  @override
  int get hashCode => Object.hash(runtimeType, monthLabel, amount, month, year);

  @override
  String toString() {
    return 'MonthlySpend(monthLabel: $monthLabel, amount: $amount, month: $month, year: $year)';
  }
}

/// @nodoc
abstract mixin class $MonthlySpendCopyWith<$Res> {
  factory $MonthlySpendCopyWith(
          MonthlySpend value, $Res Function(MonthlySpend) _then) =
      _$MonthlySpendCopyWithImpl;
  @useResult
  $Res call({String monthLabel, double amount, int month, int year});
}

/// @nodoc
class _$MonthlySpendCopyWithImpl<$Res> implements $MonthlySpendCopyWith<$Res> {
  _$MonthlySpendCopyWithImpl(this._self, this._then);

  final MonthlySpend _self;
  final $Res Function(MonthlySpend) _then;

  /// Create a copy of MonthlySpend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthLabel = null,
    Object? amount = null,
    Object? month = null,
    Object? year = null,
  }) {
    return _then(_self.copyWith(
      monthLabel: null == monthLabel
          ? _self.monthLabel
          : monthLabel // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      month: null == month
          ? _self.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [MonthlySpend].
extension MonthlySpendPatterns on MonthlySpend {
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
    TResult Function(_MonthlySpend value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MonthlySpend() when $default != null:
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
    TResult Function(_MonthlySpend value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MonthlySpend():
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
    TResult? Function(_MonthlySpend value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MonthlySpend() when $default != null:
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
    TResult Function(String monthLabel, double amount, int month, int year)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MonthlySpend() when $default != null:
        return $default(
            _that.monthLabel, _that.amount, _that.month, _that.year);
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
    TResult Function(String monthLabel, double amount, int month, int year)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MonthlySpend():
        return $default(
            _that.monthLabel, _that.amount, _that.month, _that.year);
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
    TResult? Function(String monthLabel, double amount, int month, int year)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MonthlySpend() when $default != null:
        return $default(
            _that.monthLabel, _that.amount, _that.month, _that.year);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MonthlySpend implements MonthlySpend {
  const _MonthlySpend(
      {required this.monthLabel,
      required this.amount,
      required this.month,
      required this.year});

  @override
  final String monthLabel;
  @override
  final double amount;
  @override
  final int month;
  @override
  final int year;

  /// Create a copy of MonthlySpend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MonthlySpendCopyWith<_MonthlySpend> get copyWith =>
      __$MonthlySpendCopyWithImpl<_MonthlySpend>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MonthlySpend &&
            (identical(other.monthLabel, monthLabel) ||
                other.monthLabel == monthLabel) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year));
  }

  @override
  int get hashCode => Object.hash(runtimeType, monthLabel, amount, month, year);

  @override
  String toString() {
    return 'MonthlySpend(monthLabel: $monthLabel, amount: $amount, month: $month, year: $year)';
  }
}

/// @nodoc
abstract mixin class _$MonthlySpendCopyWith<$Res>
    implements $MonthlySpendCopyWith<$Res> {
  factory _$MonthlySpendCopyWith(
          _MonthlySpend value, $Res Function(_MonthlySpend) _then) =
      __$MonthlySpendCopyWithImpl;
  @override
  @useResult
  $Res call({String monthLabel, double amount, int month, int year});
}

/// @nodoc
class __$MonthlySpendCopyWithImpl<$Res>
    implements _$MonthlySpendCopyWith<$Res> {
  __$MonthlySpendCopyWithImpl(this._self, this._then);

  final _MonthlySpend _self;
  final $Res Function(_MonthlySpend) _then;

  /// Create a copy of MonthlySpend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? monthLabel = null,
    Object? amount = null,
    Object? month = null,
    Object? year = null,
  }) {
    return _then(_MonthlySpend(
      monthLabel: null == monthLabel
          ? _self.monthLabel
          : monthLabel // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      month: null == month
          ? _self.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
