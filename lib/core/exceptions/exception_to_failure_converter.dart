import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/exceptions/app_exceptions.dart';
import 'package:test_shop_task/core/exceptions/exceptions.dart';

abstract class ExceptionToFailureConverter {
  static AppFailure convert(
    Object exception,
    StackTrace stackTrace,
  ) {
    log('------------------------\nEXCEPTION: $exception\n$stackTrace');
    return switch (exception) {
      AppException() => AppException(
          message: exception.message,
          stack: exception.stack,
        ),
      UnauthorizedHttpException() => UnauthorizedServerFailure(
          message: exception.message,
        ),
      BadRequestHttpException() => BadRequestServerFailure(
          message: exception.message,
        ),
      ServerErrorHttpException() => ServerFailure(
          message: exception.message,
        ),
      NoInternetException() => const NoInternetFailure(),
      HttpMethodException() => HttpMethodFailure(
          code: exception.statusCode,
          message: exception.message,
        ),
      DioException() => _handleDioException(exception),
      (_) => const UnknownServerFailure(),
    };
  }

  static AppFailure _handleDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ServerTimeoutFailure();
      case DioExceptionType.badCertificate:
        return const ServerCertificateFailure();
      case DioExceptionType.badResponse:
        return HttpMethodFailure(
          code: dioException.response?.statusCode,
          message: dioException.response?.statusMessage,
        );
      case DioExceptionType.cancel:
        return const ServerCancelFailure();
      case DioExceptionType.connectionError:
        return const ServerConnectionFailure();
      case DioExceptionType.unknown:
        return const UnknownServerFailure();
    }
  }
}
