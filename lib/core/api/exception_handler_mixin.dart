import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:test_shop_task/core/api/network_service.dart';
import 'package:test_shop_task/core/exceptions/app_exceptions.dart';
import 'package:test_shop_task/core/model/api_response.dart';
import 'package:universal_io/io.dart';

/// A mixin that provides exception handling for network requests.
///
/// It provides a [handleException] method that wraps network requests in a try-catch block
/// and handles common exceptions, such as [SocketException], [DioException], and [AppException].
mixin ExceptionHandlerMixin on NetworkService {
  /// Handles exceptions that may occur during network requests.
  ///
  /// [handler] The function that performs the actual network request.
  /// [endpoint] An optional endpoint string to provide additional context for logging.
  ///
  /// Returns a `Future<ApiResponse>` that resolves to the response data if the request is successful,
  /// or throws an `AppException` if an error occurs.
  Future<ApiResponse> handleException(
    Future<Response<Map<String, dynamic>>> Function() handler, {
    String endpoint = '',
  }) async {
    try {
      final res = await handler();
      if (res.data?['meta'] != null) {
        var meta = Meta.fromJson(res.data!['meta']);
        if (meta.error?.isNotEmpty ?? false) {
          throw AppException(
            message: meta.error,
          );
        }
      }
      return ApiResponse.fromJson(res.data!);
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      String message = '';
      switch (e.runtimeType) {
        case const (SocketException):
          e as SocketException;
          message = 'Unable to connect to the server.';
          break;

        case const (DioException):
          e as DioException;
          message = e.response?.data?['message'] ?? 'Internal Error occurred';
          break;
        case const (AppException):
          e as AppException;
          message = e.message ?? 'Unknown error occurred';
          break;
        default:
          message = 'Unknown error occurred';
      }
      throw AppException(message: message, stack: s);
    }
  }
}
