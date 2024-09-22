import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/api/private_api.dart';
import 'package:test_shop_task/core/model/api_response.dart';
import 'package:test_shop_task/features/user/data/models/user.dart';

part 'user_remote_data_source_impl.dart';

abstract class UserRemoteDataSource {
  Future<User> profile();

  Future<bool> logout();

  Future<bool> deleteAccount();

  Future<ApiResponse> sendConfirmationCode({required String phone});
}
