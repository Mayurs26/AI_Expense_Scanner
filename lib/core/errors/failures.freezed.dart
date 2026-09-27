// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Failure {
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FailureCopyWith<Failure> get copyWith =>
      _$FailureCopyWithImpl<Failure>(this as Failure, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Failure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'Failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) =
      _$FailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseFailure value)? database,
    TResult Function(NetworkFailure value)? network,
    TResult Function(AuthFailure value)? auth,
    TResult Function(ScannerFailure value)? scanner,
    TResult Function(AIFailure value)? ai,
    TResult Function(CacheFailure value)? cache,
    TResult Function(PermissionFailure value)? permission,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DatabaseFailure() when database != null:
        return database(_that);
      case NetworkFailure() when network != null:
        return network(_that);
      case AuthFailure() when auth != null:
        return auth(_that);
      case ScannerFailure() when scanner != null:
        return scanner(_that);
      case AIFailure() when ai != null:
        return ai(_that);
      case CacheFailure() when cache != null:
        return cache(_that);
      case PermissionFailure() when permission != null:
        return permission(_that);
      case ValidationFailure() when validation != null:
        return validation(_that);
      case UnknownFailure() when unknown != null:
        return unknown(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseFailure value) database,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(ScannerFailure value) scanner,
    required TResult Function(AIFailure value) ai,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(PermissionFailure value) permission,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    final _that = this;
    switch (_that) {
      case DatabaseFailure():
        return database(_that);
      case NetworkFailure():
        return network(_that);
      case AuthFailure():
        return auth(_that);
      case ScannerFailure():
        return scanner(_that);
      case AIFailure():
        return ai(_that);
      case CacheFailure():
        return cache(_that);
      case PermissionFailure():
        return permission(_that);
      case ValidationFailure():
        return validation(_that);
      case UnknownFailure():
        return unknown(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseFailure value)? database,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(ScannerFailure value)? scanner,
    TResult? Function(AIFailure value)? ai,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(PermissionFailure value)? permission,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    final _that = this;
    switch (_that) {
      case DatabaseFailure() when database != null:
        return database(_that);
      case NetworkFailure() when network != null:
        return network(_that);
      case AuthFailure() when auth != null:
        return auth(_that);
      case ScannerFailure() when scanner != null:
        return scanner(_that);
      case AIFailure() when ai != null:
        return ai(_that);
      case CacheFailure() when cache != null:
        return cache(_that);
      case PermissionFailure() when permission != null:
        return permission(_that);
      case ValidationFailure() when validation != null:
        return validation(_that);
      case UnknownFailure() when unknown != null:
        return unknown(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? code)? database,
    TResult Function(String message, int? statusCode)? network,
    TResult Function(String message, String? code)? auth,
    TResult Function(String message, String? code)? scanner,
    TResult Function(String message, String? code)? ai,
    TResult Function(String message)? cache,
    TResult Function(String message)? permission,
    TResult Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DatabaseFailure() when database != null:
        return database(_that.message, _that.code);
      case NetworkFailure() when network != null:
        return network(_that.message, _that.statusCode);
      case AuthFailure() when auth != null:
        return auth(_that.message, _that.code);
      case ScannerFailure() when scanner != null:
        return scanner(_that.message, _that.code);
      case AIFailure() when ai != null:
        return ai(_that.message, _that.code);
      case CacheFailure() when cache != null:
        return cache(_that.message);
      case PermissionFailure() when permission != null:
        return permission(_that.message);
      case ValidationFailure() when validation != null:
        return validation(_that.message, _that.fieldErrors);
      case UnknownFailure() when unknown != null:
        return unknown(_that.message);
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
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? code) database,
    required TResult Function(String message, int? statusCode) network,
    required TResult Function(String message, String? code) auth,
    required TResult Function(String message, String? code) scanner,
    required TResult Function(String message, String? code) ai,
    required TResult Function(String message) cache,
    required TResult Function(String message) permission,
    required TResult Function(String message, Map<String, String>? fieldErrors)
        validation,
    required TResult Function(String message) unknown,
  }) {
    final _that = this;
    switch (_that) {
      case DatabaseFailure():
        return database(_that.message, _that.code);
      case NetworkFailure():
        return network(_that.message, _that.statusCode);
      case AuthFailure():
        return auth(_that.message, _that.code);
      case ScannerFailure():
        return scanner(_that.message, _that.code);
      case AIFailure():
        return ai(_that.message, _that.code);
      case CacheFailure():
        return cache(_that.message);
      case PermissionFailure():
        return permission(_that.message);
      case ValidationFailure():
        return validation(_that.message, _that.fieldErrors);
      case UnknownFailure():
        return unknown(_that.message);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? code)? database,
    TResult? Function(String message, int? statusCode)? network,
    TResult? Function(String message, String? code)? auth,
    TResult? Function(String message, String? code)? scanner,
    TResult? Function(String message, String? code)? ai,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? permission,
    TResult? Function(String message, Map<String, String>? fieldErrors)?
        validation,
    TResult? Function(String message)? unknown,
  }) {
    final _that = this;
    switch (_that) {
      case DatabaseFailure() when database != null:
        return database(_that.message, _that.code);
      case NetworkFailure() when network != null:
        return network(_that.message, _that.statusCode);
      case AuthFailure() when auth != null:
        return auth(_that.message, _that.code);
      case ScannerFailure() when scanner != null:
        return scanner(_that.message, _that.code);
      case AIFailure() when ai != null:
        return ai(_that.message, _that.code);
      case CacheFailure() when cache != null:
        return cache(_that.message);
      case PermissionFailure() when permission != null:
        return permission(_that.message);
      case ValidationFailure() when validation != null:
        return validation(_that.message, _that.fieldErrors);
      case UnknownFailure() when unknown != null:
        return unknown(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class DatabaseFailure implements Failure {
  const DatabaseFailure({required this.message, this.code});

  @override
  final String message;
  final String? code;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DatabaseFailureCopyWith<DatabaseFailure> get copyWith =>
      _$DatabaseFailureCopyWithImpl<DatabaseFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DatabaseFailure &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @override
  String toString() {
    return 'Failure.database(message: $message, code: $code)';
  }
}

/// @nodoc
abstract mixin class $DatabaseFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $DatabaseFailureCopyWith(
          DatabaseFailure value, $Res Function(DatabaseFailure) _then) =
      _$DatabaseFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class _$DatabaseFailureCopyWithImpl<$Res>
    implements $DatabaseFailureCopyWith<$Res> {
  _$DatabaseFailureCopyWithImpl(this._self, this._then);

  final DatabaseFailure _self;
  final $Res Function(DatabaseFailure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(DatabaseFailure(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class NetworkFailure implements Failure {
  const NetworkFailure({required this.message, this.statusCode});

  @override
  final String message;
  final int? statusCode;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NetworkFailureCopyWith<NetworkFailure> get copyWith =>
      _$NetworkFailureCopyWithImpl<NetworkFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NetworkFailure &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, statusCode);

  @override
  String toString() {
    return 'Failure.network(message: $message, statusCode: $statusCode)';
  }
}

/// @nodoc
abstract mixin class $NetworkFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $NetworkFailureCopyWith(
          NetworkFailure value, $Res Function(NetworkFailure) _then) =
      _$NetworkFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message, int? statusCode});
}

/// @nodoc
class _$NetworkFailureCopyWithImpl<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  _$NetworkFailureCopyWithImpl(this._self, this._then);

  final NetworkFailure _self;
  final $Res Function(NetworkFailure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? statusCode = freezed,
  }) {
    return _then(NetworkFailure(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class AuthFailure implements Failure {
  const AuthFailure({required this.message, this.code});

  @override
  final String message;
  final String? code;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthFailureCopyWith<AuthFailure> get copyWith =>
      _$AuthFailureCopyWithImpl<AuthFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthFailure &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @override
  String toString() {
    return 'Failure.auth(message: $message, code: $code)';
  }
}

/// @nodoc
abstract mixin class $AuthFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) _then) =
      _$AuthFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._self, this._then);

  final AuthFailure _self;
  final $Res Function(AuthFailure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(AuthFailure(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class ScannerFailure implements Failure {
  const ScannerFailure({required this.message, this.code});

  @override
  final String message;
  final String? code;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScannerFailureCopyWith<ScannerFailure> get copyWith =>
      _$ScannerFailureCopyWithImpl<ScannerFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScannerFailure &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @override
  String toString() {
    return 'Failure.scanner(message: $message, code: $code)';
  }
}

/// @nodoc
abstract mixin class $ScannerFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $ScannerFailureCopyWith(
          ScannerFailure value, $Res Function(ScannerFailure) _then) =
      _$ScannerFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class _$ScannerFailureCopyWithImpl<$Res>
    implements $ScannerFailureCopyWith<$Res> {
  _$ScannerFailureCopyWithImpl(this._self, this._then);

  final ScannerFailure _self;
  final $Res Function(ScannerFailure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(ScannerFailure(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class AIFailure implements Failure {
  const AIFailure({required this.message, this.code});

  @override
  final String message;
  final String? code;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AIFailureCopyWith<AIFailure> get copyWith =>
      _$AIFailureCopyWithImpl<AIFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AIFailure &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @override
  String toString() {
    return 'Failure.ai(message: $message, code: $code)';
  }
}

/// @nodoc
abstract mixin class $AIFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $AIFailureCopyWith(AIFailure value, $Res Function(AIFailure) _then) =
      _$AIFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class _$AIFailureCopyWithImpl<$Res> implements $AIFailureCopyWith<$Res> {
  _$AIFailureCopyWithImpl(this._self, this._then);

  final AIFailure _self;
  final $Res Function(AIFailure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(AIFailure(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class CacheFailure implements Failure {
  const CacheFailure({required this.message});

  @override
  final String message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CacheFailureCopyWith<CacheFailure> get copyWith =>
      _$CacheFailureCopyWithImpl<CacheFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CacheFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'Failure.cache(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CacheFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $CacheFailureCopyWith(
          CacheFailure value, $Res Function(CacheFailure) _then) =
      _$CacheFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CacheFailureCopyWithImpl<$Res> implements $CacheFailureCopyWith<$Res> {
  _$CacheFailureCopyWithImpl(this._self, this._then);

  final CacheFailure _self;
  final $Res Function(CacheFailure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CacheFailure(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class PermissionFailure implements Failure {
  const PermissionFailure({required this.message});

  @override
  final String message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PermissionFailureCopyWith<PermissionFailure> get copyWith =>
      _$PermissionFailureCopyWithImpl<PermissionFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PermissionFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'Failure.permission(message: $message)';
  }
}

/// @nodoc
abstract mixin class $PermissionFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $PermissionFailureCopyWith(
          PermissionFailure value, $Res Function(PermissionFailure) _then) =
      _$PermissionFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$PermissionFailureCopyWithImpl<$Res>
    implements $PermissionFailureCopyWith<$Res> {
  _$PermissionFailureCopyWithImpl(this._self, this._then);

  final PermissionFailure _self;
  final $Res Function(PermissionFailure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(PermissionFailure(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ValidationFailure implements Failure {
  const ValidationFailure(
      {required this.message, final Map<String, String>? fieldErrors})
      : _fieldErrors = fieldErrors;

  @override
  final String message;
  final Map<String, String>? _fieldErrors;
  Map<String, String>? get fieldErrors {
    final value = _fieldErrors;
    if (value == null) return null;
    if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ValidationFailureCopyWith<ValidationFailure> get copyWith =>
      _$ValidationFailureCopyWithImpl<ValidationFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ValidationFailure &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._fieldErrors, _fieldErrors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_fieldErrors));

  @override
  String toString() {
    return 'Failure.validation(message: $message, fieldErrors: $fieldErrors)';
  }
}

/// @nodoc
abstract mixin class $ValidationFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $ValidationFailureCopyWith(
          ValidationFailure value, $Res Function(ValidationFailure) _then) =
      _$ValidationFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message, Map<String, String>? fieldErrors});
}

/// @nodoc
class _$ValidationFailureCopyWithImpl<$Res>
    implements $ValidationFailureCopyWith<$Res> {
  _$ValidationFailureCopyWithImpl(this._self, this._then);

  final ValidationFailure _self;
  final $Res Function(ValidationFailure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? fieldErrors = freezed,
  }) {
    return _then(ValidationFailure(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      fieldErrors: freezed == fieldErrors
          ? _self._fieldErrors
          : fieldErrors // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc

class UnknownFailure implements Failure {
  const UnknownFailure({required this.message});

  @override
  final String message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnknownFailureCopyWith<UnknownFailure> get copyWith =>
      _$UnknownFailureCopyWithImpl<UnknownFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnknownFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'Failure.unknown(message: $message)';
  }
}

/// @nodoc
abstract mixin class $UnknownFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $UnknownFailureCopyWith(
          UnknownFailure value, $Res Function(UnknownFailure) _then) =
      _$UnknownFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$UnknownFailureCopyWithImpl<$Res>
    implements $UnknownFailureCopyWith<$Res> {
  _$UnknownFailureCopyWithImpl(this._self, this._then);

  final UnknownFailure _self;
  final $Res Function(UnknownFailure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(UnknownFailure(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
