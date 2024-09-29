import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/api/private_api.dart';
import 'package:test_shop_task/features/user/data/models/user.dart';
import 'package:test_shop_task/features/user/domain/entities/user_entity.dart';
import 'package:path/path.dart';

part 'user_remote_data_source_impl.dart';

abstract class UserRemoteDataSource {
  Future<User> profile();

  Future<User> changeProfile(UserEntity user);

  Future<bool> logout();

  Future<bool> deleteAccount();
}
