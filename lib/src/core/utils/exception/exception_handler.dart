import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../localization/locale_keys.g.dart';
import '../extensions/string_extension.dart';
import 'exception_data_model/exception_data_model.dart';

/// A custom exception class for handling application-specific errors.
class AppException implements Exception {
  /// Creates an instance of [AppException].
  const AppException({
    required this.code,
    required this.message,
    this.statusCode,
    this.stackTrace,
    this.data,
  });

  factory AppException.unknown([StackTrace? stackTrace]) {
    return AppException(
      code: ErrorType.unknown.code,
      message: ErrorType.unknown.name.etr(),
      stackTrace: stackTrace,
    );
  }

  /// A unique code identifying the type of error.
  final String code;

  /// A message describing the error.
  final String message;

  /// Additional data related to the error.
  final Object? data;

  final int? statusCode;

  final StackTrace? stackTrace;
}

/// A handler class for processing different types of exceptions.
class ExceptionHandler implements Exception {
  const ExceptionHandler();

  /// Handles an [error] and returns an [AppException] based on its type.
  static AppException handle(Object error, {StackTrace? stackTrace}) {
    switch (error.runtimeType) {
      case const (DioException):
        return handleDioException(error as DioException);
      case const (TypeError):
        return AppException(
          data: error,
          code: ErrorType.typeError.code,
          message: LocaleKeys.errors_type_error.tr(),
          stackTrace: stackTrace,
        );
      case const (StateError):
        return AppException(
          data: error,
          code: ErrorType.stateError.code,
          message: LocaleKeys.errors_state_error.tr(),
          stackTrace: stackTrace,
        );
      case const (RangeError):
        return AppException(
          data: error,
          code: ErrorType.rangeError.code,
          message: LocaleKeys.errors_range_error.tr(),
          stackTrace: stackTrace,
        );
      case const (FormatException):
        return AppException(
          data: error,
          code: ErrorType.formatException.code,
          message: LocaleKeys.errors_format_exception.tr(),
          stackTrace: stackTrace,
        );
      case const (NoSuchMethodError):
        return AppException(
          data: error,
          code: ErrorType.noSuchMethodError.code,
          message: LocaleKeys.errors_no_such_method_error.tr(),
          stackTrace: stackTrace,
        );
      default:
        return AppException.unknown(stackTrace);
    }
  }

  /// Handles a [DioException] and returns an appropriate [AppException].
  static AppException handleDioException(
    DioException dioException, {
    StackTrace? stackTrace,
  }) {
    final errType = dioException.type;

    if (errType == DioExceptionType.badResponse) {
      return _handleBadResponse(
        dioException.response,
        stackTrace: stackTrace,
      );
    }

    return AppException(
      code: errType.name.toSnakeCase,
      message: errType.name.toSnakeCase.etr(),
      stackTrace: stackTrace,
    );
  }

  /// Processes a bad response from the server and returns an [AppException].
  static AppException _handleBadResponse(
    Response<dynamic>? response, {
    StackTrace? stackTrace,
  }) {
    if (response?.statusCode == 404) {
      return AppException(
        code: ErrorType.pageNotFound.code,
        message: LocaleKeys.errors_page_not_found.tr(),
        statusCode: response!.statusCode,
        stackTrace: stackTrace,
      );
    }

    if (response == null) {
      return AppException.unknown(stackTrace);
    }

    if (response.data is Map<String, dynamic>) {
      final data = ExceptionDataModel.fromJson(
        response.data as Map<String, dynamic>,
      );

      if (data.messages.isNotEmpty) {
        final first = data.messages.first;

        if (first.message != null) {
          return AppException(
            code: first.tokenType ?? ErrorType.badResponse.code,
            message: first.message!,
            statusCode: response.statusCode,
          );
        }
      }

      if (data.error != null) {
        return AppException(
          code: data.code ?? ErrorType.badResponse.code,
          message: data.error!,
          statusCode: response.statusCode,
          stackTrace: stackTrace,
        );
      }

      if (data.detail != null) {
        return AppException(
          code: data.code ?? ErrorType.badResponse.code,
          message: data.detail!,
          statusCode: response.statusCode,
          stackTrace: stackTrace,
        );
      }
    }

    return AppException.unknown(stackTrace);
  }
}

/// Enum representing different types of errors.
enum ErrorType {
  connectionTimeout,
  sendTimeout,
  receiveTimeout,
  badCertificate,
  badResponse,
  pageNotFound,
  cancel,
  connectionError,
  unknown,
  tokenNotValid,
  typeError,
  stateError,
  rangeError,
  formatException,
  noSuchMethodError;
}

/// Extension to get the snake case code of an [ErrorType].
extension EnumName on ErrorType {
  String get code => name.toSnakeCase;
}
