import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/exceptions/exception_to_failure_converter.dart';
import 'package:test_shop_task/features/user/data/datasources/remote/user_remote_data_source.dart';
import 'package:test_shop_task/features/user/data/models/user.dart';
import 'package:test_shop_task/features/user/domain/entities/user_entity.dart';

part 'package:test_shop_task/features/user/data/repositories/user_repository_impl.dart';

abstract class UserRepository {
  Future<Either<AppFailure, UserEntity>> getUser();

  Future<Either<AppFailure, UserEntity>> changeProfile(UserEntity user);
}
