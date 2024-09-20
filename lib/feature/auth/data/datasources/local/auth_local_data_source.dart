import 'dart:convert';


import 'package:injectable/injectable.dart';

part 'auth_local_data_source_impl.dart';

abstract interface class AuthLocalDataSource {
  // Future<AuthModel> getAuthModel();
  //
  // Future<void> saveAuthModel({
  //   required AuthModel authModel,
  // });

  Future<void> deleteAuthModel();
}
