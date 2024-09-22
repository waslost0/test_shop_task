import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/api/base_api.dart';
import 'package:test_shop_task/features/auth/data/models/auth_response.dart';

part 'auth_remote_data_source_impl.dart';

abstract interface class AuthRemoteDataSource {
  Future<bool> sendConfirmationCode({
    required String phone,
  });

  Future<AuthResponse> login({
    required String phone,
    required String code,
  });

  Future logout();
}
