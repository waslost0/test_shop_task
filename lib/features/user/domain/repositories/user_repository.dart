import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/exceptions/app_exceptions.dart';
import 'package:test_shop_task/core/exceptions/exception_to_failure_converter.dart';
import 'package:test_shop_task/core/model/api_response.dart';
import 'package:test_shop_task/features/user/data/datasources/remote/user_remote_data_source.dart';
import 'package:test_shop_task/features/user/data/models/user.dart';
import 'package:test_shop_task/features/user/domain/entities/user_entity.dart';

part 'package:test_shop_task/features/user/data/repositories/user_repository_impl.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser();

  Future<Either<AppException, bool>> sendConfirmationCode({
    required String phone,
  });
}
