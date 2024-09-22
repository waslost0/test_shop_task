import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/logic/key_value_storage.dart';

part 'auth_local_data_source_impl.dart';

abstract class AuthLocalDataSource {
  String? getAccessToken();

  Future<void> saveAccessToken({
    required String accessToken,
  });

  Future<void> deleteAccessToken();
}
