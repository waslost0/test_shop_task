import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/api/dio_network_service.dart';
import 'package:test_shop_task/core/logic/app_model.dart';
import 'package:test_shop_task/features/auth/domain/repositories/auth_repository.dart';

@injectable
class PrivateApi extends DioNetworkService {
  bool shouldLogRequest = true;
  bool shouldLogResponse = false;
  final AuthRepository _authRepository;

  PrivateApi(
    this._authRepository,
  ) {
    dio.options = dioBaseOptions;
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }
    dio.interceptors.add(
      InterceptorsWrapper(onRequest: onRequest),
    );
  }

  Map<String, String> get tokenQueryParameters => {
        'accessToken': _authRepository.getAccessToken() ?? '',
      };

  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    log("[onRequest] $tokenQueryParameters");
    if (!_authRepository.isAuthenticated()) {
      return;
    } else {
      options.queryParameters.addAll(tokenQueryParameters);
    }
    handler.next(options);
  }
}
