part of 'package:test_shop_task/features/auth/domain/repositories/auth_repository.dart';


@LazySingleton(
  as: AuthRepository,
)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(
    this._remoteDataSource,
  );

  final AuthRemoteDataSource _remoteDataSource;

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
