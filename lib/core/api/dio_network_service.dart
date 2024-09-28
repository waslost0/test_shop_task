import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:test_shop_task/core/api/exception_handler_mixin.dart';
import 'package:test_shop_task/core/api/network_service.dart';
import 'package:test_shop_task/core/model/api_response.dart';
import 'package:test_shop_task/core/model/config.dart';
import 'package:test_shop_task/di/injection.dart';

abstract class DioNetworkService extends NetworkService
    with ExceptionHandlerMixin {
  final Dio dio = Dio();

  DioNetworkService() {
    dio.options = dioBaseOptions;
    if (kDebugMode) {
      dio.interceptors.add(
        TalkerDioLogger(
          talker: getIt<Talker>(),
          settings: const TalkerDioLoggerSettings(
            printErrorData: true,
            printRequestData: true,
            printErrorMessage: true,
            printResponseData: true,
            printResponseMessage: true,
          ),
        ),
      );
    }
  }

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  @override
  String get baseUrl => Config.host;

  @override
  Map<String, Object> get headers => {
        Headers.acceptHeader: Headers.jsonContentType,
        Headers.contentTypeHeader: Headers.formUrlEncodedContentType,
      };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    dio.options.headers = header;
    return header;
  }

  @override
  Future<ApiResponse> post(
    String endpoint, {
    Map<String, dynamic>? data,
  }) {
    final res = handleException(
      () => dio.post(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<ApiResponse> postWithFile(
    String endpoint, {
    FormData? data,
  }) {
    final res = handleException(
      () => dio.post(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<ApiResponse> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) {
    final res = handleException(
      () => dio.get(
        endpoint,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }
}
