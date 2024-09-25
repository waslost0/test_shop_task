import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/exceptions/app_exceptions.dart';
import 'package:test_shop_task/core/exceptions/exception_to_failure_converter.dart';
import 'package:test_shop_task/features/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:test_shop_task/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:test_shop_task/features/auth/data/models/auth_response.dart';

part 'package:test_shop_task/features/auth/data/repositories/auth_repository_impl.dart';

abstract class AuthRepository {
  Future<Either<AppFailure, AuthResponse>> login({
    required String phone,
    required String code,
  });

  Future<Either<AppFailure, bool>> sendSmsCode({
    required String phone,
  });

  String? getAccessToken();

  Future<void> deleteAccessToken();

  bool isAuthenticated();
}
