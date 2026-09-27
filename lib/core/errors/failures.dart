import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Domain-level failures — returned by repositories instead of throwing exceptions
@freezed
sealed class Failure with _$Failure {
  const factory Failure.database({
    required String message,
    String? code,
  }) = DatabaseFailure;

  const factory Failure.network({
    required String message,
    int? statusCode,
  }) = NetworkFailure;

  const factory Failure.auth({
    required String message,
    String? code,
  }) = AuthFailure;

  const factory Failure.scanner({
    required String message,
    String? code,
  }) = ScannerFailure;

  const factory Failure.ai({
    required String message,
    String? code,
  }) = AIFailure;

  const factory Failure.cache({
    required String message,
  }) = CacheFailure;

  const factory Failure.permission({
    required String message,
  }) = PermissionFailure;

  const factory Failure.validation({
    required String message,
    Map<String, String>? fieldErrors,
  }) = ValidationFailure;

  const factory Failure.unknown({
    required String message,
  }) = UnknownFailure;
}
