import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/api/dio_network_service.dart';
import 'package:test_shop_task/core/logic/app_model.dart';

final privateApiProvider = Provider<DioNetworkService>(
  (ref) {
    var appModel = ref.read(appModelProvider);
    return PrivateApi(appModel: appModel);
  },
);

class PrivateApi extends DioNetworkService {
  bool shouldLogRequest = true;
  bool shouldLogResponse = false;
  final AppModel appModel;

  PrivateApi({
    required this.appModel,
  }) {
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
        'accessToken': appModel.appUser.getAccessToken() ?? '',
      };

  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    log("[onRequest] $tokenQueryParameters");
    if (!appModel.appUser.isAuthenticated()) {
      return;
    } else {
      options.queryParameters.addAll(tokenQueryParameters);
    }
    handler.next(options);
  }
}
