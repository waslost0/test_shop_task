import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/api/dio_network_service.dart';

final baseApiProvider = Provider<DioNetworkService>(
  (ref) {
    return BaseApi();
  },
);

class BaseApi extends DioNetworkService {
  BaseApi();
}
