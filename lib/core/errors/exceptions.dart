/// Base exception for the app
class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic details;

  const AppException(this.message, {this.code, this.details});

  @override
  String toString() => 'AppException: $message (code: $code)';
}

/// Thrown when database operations fail
class DatabaseException extends AppException {
  const DatabaseException(super.message, {super.code, super.details});
}

/// Thrown when network/API operations fail
class NetworkException extends AppException {
  final int? statusCode;
  const NetworkException(super.message, {super.code, this.statusCode, super.details});
}

/// Thrown when auth operations fail
class AuthException extends AppException {
  const AuthException(super.message, {super.code, super.details});
}

/// Thrown when OCR/camera operations fail
class ScannerException extends AppException {
  const ScannerException(super.message, {super.code, super.details});
}

/// Thrown when Gemini AI operations fail
class AIException extends AppException {
  const AIException(super.message, {super.code, super.details});
}

/// Thrown when a cache/local storage operation fails
class CacheException extends AppException {
  const CacheException(super.message, {super.code, super.details});
}

/// Thrown when a permission is denied
class PermissionException extends AppException {
  const PermissionException(super.message, {super.code, super.details});
}

/// Thrown for validation errors
class ValidationException extends AppException {
  final Map<String, String>? fieldErrors;
  const ValidationException(super.message, {this.fieldErrors, super.code});
}
