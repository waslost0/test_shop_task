import 'dart:io';

import 'package:dio/dio.dart';
import 'package:test_shop_task/core/api/network_service.dart';
import 'package:test_shop_task/core/exceptions/app_exceptions.dart';
import 'package:test_shop_task/core/model/api_response.dart';

mixin ExceptionHandlerMixin on NetworkService {
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
    } catch (e) {
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
      throw AppException(message: message);
    }
  }
}
