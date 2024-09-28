import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/api/dio_network_service.dart';
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
    if (!_authRepository.isAuthenticated()) {
      return;
    } else {
      options.queryParameters.addAll(tokenQueryParameters);
    }
    handler.next(options);
  }
}
