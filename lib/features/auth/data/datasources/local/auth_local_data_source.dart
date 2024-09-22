import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/logic/key_value_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_local_data_source_impl.dart';

abstract interface class AuthLocalDataSource {
  // Future<AuthModel> getAuthModel();
  //
  // Future<void> saveAuthModel({
  //   required AuthModel authModel,
  // });

  Future<void> deleteAuthModel();
}
