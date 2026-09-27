// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettings {
  String get themeMode;
  String get currencySymbol;
  String get currencyCode;
  double get totalMonthlyBudget;
  bool get biometricEnabled;
  bool get notificationsEnabled;
  String get locale;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppSettings &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.totalMonthlyBudget, totalMonthlyBudget) ||
                other.totalMonthlyBudget == totalMonthlyBudget) &&
            (identical(other.biometricEnabled, biometricEnabled) ||
                other.biometricEnabled == biometricEnabled) &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                other.notificationsEnabled == notificationsEnabled) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      themeMode,
      currencySymbol,
      currencyCode,
      totalMonthlyBudget,
      biometricEnabled,
      notificationsEnabled,
      locale);

  @override
  String toString() {
    return 'AppSettings(themeMode: $themeMode, currencySymbol: $currencySymbol, currencyCode: $currencyCode, totalMonthlyBudget: $totalMonthlyBudget, biometricEnabled: $biometricEnabled, notificationsEnabled: $notificationsEnabled, locale: $locale)';
  }
}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
          AppSettings value, $Res Function(AppSettings) _then) =
      _$AppSettingsCopyWithImpl;
  @useResult
  $Res call(
      {String themeMode,
      String currencySymbol,
      String currencyCode,
      double totalMonthlyBudget,
      bool biometricEnabled,
      bool notificationsEnabled,
      String locale});
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res> implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? currencySymbol = null,
    Object? currencyCode = null,
    Object? totalMonthlyBudget = null,
    Object? biometricEnabled = null,
    Object? notificationsEnabled = null,
    Object? locale = null,
  }) {
    return _then(_self.copyWith(
      themeMode: null == themeMode
          ? _self.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _self.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCode: null == currencyCode
          ? _self.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      totalMonthlyBudget: null == totalMonthlyBudget
          ? _self.totalMonthlyBudget
          : totalMonthlyBudget // ignore: cast_nullable_to_non_nullable
              as double,
      biometricEnabled: null == biometricEnabled
          ? _self.biometricEnabled
          : biometricEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationsEnabled: null == notificationsEnabled
          ? _self.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      locale: null == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [AppSettings].
extension AppSettingsPatterns on AppSettings {
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
    TResult Function(_AppSettings value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppSettings() when $default != null:
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
    TResult Function(_AppSettings value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppSettings():
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
    TResult? Function(_AppSettings value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppSettings() when $default != null:
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
            String themeMode,
            String currencySymbol,
            String currencyCode,
            double totalMonthlyBudget,
            bool biometricEnabled,
            bool notificationsEnabled,
            String locale)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppSettings() when $default != null:
        return $default(
            _that.themeMode,
            _that.currencySymbol,
            _that.currencyCode,
            _that.totalMonthlyBudget,
            _that.biometricEnabled,
            _that.notificationsEnabled,
            _that.locale);
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
            String themeMode,
            String currencySymbol,
            String currencyCode,
            double totalMonthlyBudget,
            bool biometricEnabled,
            bool notificationsEnabled,
            String locale)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppSettings():
        return $default(
            _that.themeMode,
            _that.currencySymbol,
            _that.currencyCode,
            _that.totalMonthlyBudget,
            _that.biometricEnabled,
            _that.notificationsEnabled,
            _that.locale);
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
            String themeMode,
            String currencySymbol,
            String currencyCode,
            double totalMonthlyBudget,
            bool biometricEnabled,
            bool notificationsEnabled,
            String locale)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppSettings() when $default != null:
        return $default(
            _that.themeMode,
            _that.currencySymbol,
            _that.currencyCode,
            _that.totalMonthlyBudget,
            _that.biometricEnabled,
            _that.notificationsEnabled,
            _that.locale);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AppSettings implements AppSettings {
  const _AppSettings(
      {this.themeMode = 'system',
      this.currencySymbol = '₹',
      this.currencyCode = 'INR',
      this.totalMonthlyBudget = 0.0,
      this.biometricEnabled = false,
      this.notificationsEnabled = true,
      this.locale = 'en_IN'});

  @override
  @JsonKey()
  final String themeMode;
  @override
  @JsonKey()
  final String currencySymbol;
  @override
  @JsonKey()
  final String currencyCode;
  @override
  @JsonKey()
  final double totalMonthlyBudget;
  @override
  @JsonKey()
  final bool biometricEnabled;
  @override
  @JsonKey()
  final bool notificationsEnabled;
  @override
  @JsonKey()
  final String locale;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppSettingsCopyWith<_AppSettings> get copyWith =>
      __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppSettings &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.totalMonthlyBudget, totalMonthlyBudget) ||
                other.totalMonthlyBudget == totalMonthlyBudget) &&
            (identical(other.biometricEnabled, biometricEnabled) ||
                other.biometricEnabled == biometricEnabled) &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                other.notificationsEnabled == notificationsEnabled) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      themeMode,
      currencySymbol,
      currencyCode,
      totalMonthlyBudget,
      biometricEnabled,
      notificationsEnabled,
      locale);

  @override
  String toString() {
    return 'AppSettings(themeMode: $themeMode, currencySymbol: $currencySymbol, currencyCode: $currencyCode, totalMonthlyBudget: $totalMonthlyBudget, biometricEnabled: $biometricEnabled, notificationsEnabled: $notificationsEnabled, locale: $locale)';
  }
}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(
          _AppSettings value, $Res Function(_AppSettings) _then) =
      __$AppSettingsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String themeMode,
      String currencySymbol,
      String currencyCode,
      double totalMonthlyBudget,
      bool biometricEnabled,
      bool notificationsEnabled,
      String locale});
}

/// @nodoc
class __$AppSettingsCopyWithImpl<$Res> implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(this._self, this._then);

  final _AppSettings _self;
  final $Res Function(_AppSettings) _then;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? themeMode = null,
    Object? currencySymbol = null,
    Object? currencyCode = null,
    Object? totalMonthlyBudget = null,
    Object? biometricEnabled = null,
    Object? notificationsEnabled = null,
    Object? locale = null,
  }) {
    return _then(_AppSettings(
      themeMode: null == themeMode
          ? _self.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _self.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCode: null == currencyCode
          ? _self.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      totalMonthlyBudget: null == totalMonthlyBudget
          ? _self.totalMonthlyBudget
          : totalMonthlyBudget // ignore: cast_nullable_to_non_nullable
              as double,
      biometricEnabled: null == biometricEnabled
          ? _self.biometricEnabled
          : biometricEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationsEnabled: null == notificationsEnabled
          ? _self.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      locale: null == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
