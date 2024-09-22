import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/api/dio_network_service.dart';

@injectable
class BaseApi extends DioNetworkService {
  BaseApi();
}
