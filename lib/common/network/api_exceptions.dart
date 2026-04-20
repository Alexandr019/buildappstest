import 'package:dio/dio.dart';

abstract class ApiException {
  const ApiException();

  String get userMessage;
}

class BaseApiException extends DioException implements ApiException {
  BaseApiException({required DioException dioError, required this.errorCode, this.details})
      : super(
          requestOptions: dioError.requestOptions,
          response: dioError.response,
          type: dioError.type,
          error: dioError.error,
        );

  final String errorCode;

  final String? details;

  @override
  String get message => details?.toString() ?? error?.toString() ?? '';

  @override
  String get userMessage {
    switch (errorCode) {
      case 'ERR002':
        return 'Request method error';
      case 'ERR003':
        return 'Access error. Check your permissions';
      case 'ERR004':
        return 'Server error. Please try again later';
      case 'ERR005':
        return 'Database error. Please try again later';
      case 'ERR007':
        return 'Resource not found';
      case 'ERR024':
        return 'Invalid task identifier';
      case 'ERR038':
        return 'One or more items contain invalid data';
      case 'ERR999':
        return 'Unknown error. Please try again';
      default:
        return details ?? (message.isNotEmpty ? message : 'An error occurred');
    }
  }

  @override
  String toString() => 'BaseApiException{errorCode: $errorCode, details: $details}';

  factory BaseApiException.parse(DioException err, {bool hasConnection = false}) {
    if (err.type == DioExceptionType.connectionError) {
      return BaseApiException(
        dioError: err,
        errorCode: 'ERR999',
        details: const NetworkException().userMessage,
      );
    }

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout) {
      return BaseApiException(
        dioError: err,
        errorCode: 'ERR999',
        details: 'Request timed out. Please try again',
      );
    }

    if (err.type == DioExceptionType.cancel) {
      return BaseApiException(
        dioError: err,
        errorCode: 'ERR999',
        details: 'Request was canceled',
      );
    }

    if (err.response?.data is Map) {
      final data = err.response!.data as Map<String, dynamic>;
      final errorCode = data['error'] as String? ?? data['code'] as String? ?? 'ERR999';
      final errorDetails = data['details'] as String? ?? data['message'] as String?;

      switch (errorCode) {
        case 'ERR002':
          return MethodErrorException(dioError: err, details: errorDetails);
        case 'ERR003':
          return AccessErrorException(dioError: err, details: errorDetails);
        case 'ERR004':
          return ServerErrorException(dioError: err, details: errorDetails);
        case 'ERR005':
          return DatabaseErrorException(dioError: err, details: errorDetails);
        case 'ERR007':
          return NotFoundErrorException(dioError: err, details: errorDetails);
        case 'ERR024':
          return InvalidTaskIdException(dioError: err, details: errorDetails);
        case 'ERR038':
          return InvalidArrayItemsException(dioError: err, details: errorDetails);
        case 'invalid-request':
          return InvalidRequestException(dioError: err, details: errorDetails);
        default:
          return BaseApiException(dioError: err, errorCode: errorCode, details: errorDetails);
      }
    }

    return BaseApiException(dioError: err, errorCode: 'ERR999', details: 'Unknown error');
  }
}

class MethodErrorException extends BaseApiException {
  MethodErrorException({required super.dioError, super.errorCode = 'ERR002', super.details});
}

class AccessErrorException extends BaseApiException {
  AccessErrorException({required super.dioError, super.errorCode = 'ERR003', super.details});
}

class ServerErrorException extends BaseApiException {
  ServerErrorException({required super.dioError, super.errorCode = 'ERR004', super.details});
}

class DatabaseErrorException extends BaseApiException {
  DatabaseErrorException({required super.dioError, super.errorCode = 'ERR005', super.details});
}

class NotFoundErrorException extends BaseApiException {
  NotFoundErrorException({required super.dioError, super.errorCode = 'ERR007', super.details});
}

class InvalidTaskIdException extends BaseApiException {
  InvalidTaskIdException({required super.dioError, super.errorCode = 'ERR024', super.details});
}

class InvalidArrayItemsException extends BaseApiException {
  InvalidArrayItemsException({required super.dioError, super.errorCode = 'ERR038', super.details});
}

class InvalidRequestException extends BaseApiException {
  InvalidRequestException({required super.dioError, super.errorCode = 'invalid-request', super.details});
}

class NetworkException implements ApiException {
  const NetworkException([this.message = 'No internet connection']);

  final String message;

  @override
  String get userMessage => message;

  @override
  String toString() => 'NetworkException: $message';
}
