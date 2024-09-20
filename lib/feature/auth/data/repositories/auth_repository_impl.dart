import 'package:dartz/dartz.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/exceptions/exception_to_failure_converter.dart';
import 'package:test_shop_task/feature/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:test_shop_task/feature/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:test_shop_task/feature/auth/data/models/auth_response.dart';

part 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
  );

  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, AuthResponse>> login({
    required String phone,
    required String code,
  }) async {
    try {
      final response = await _remoteDataSource.login(
        phone: phone,
        code: code,
      );
      return Right(response);
    } catch (e, s) {
      return Left(ExceptionToFailureConverter.convert(e, s));
    }
  }
}
