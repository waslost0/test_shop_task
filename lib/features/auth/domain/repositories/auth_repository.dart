import 'package:dartz/dartz.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/exceptions/exception_to_failure_converter.dart';
import 'package:test_shop_task/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:test_shop_task/features/auth/data/models/auth_response.dart';
import 'package:injectable/injectable.dart';

part 'package:test_shop_task/features/auth/data/repositories/auth_repository_impl.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> login({
    required String phone,
    required String code,
  });
}
