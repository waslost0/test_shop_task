part of 'package:test_shop_task/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(
  as: AuthRepository,
)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
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
      if (response.accessToken?.isNotEmpty ?? false) {
        await _localDataSource.saveAccessToken(
          accessToken: response.accessToken!,
        );
        return Right(response);
      }
      return const Left(AppException(message: "Failed to get access token"));
    } catch (e, s) {
      return Left(ExceptionToFailureConverter.convert(e, s));
    }
  }

  @override
  String? getAccessToken() {
    return _localDataSource.getAccessToken();
  }

  @override
  bool isAuthenticated() {
    return getAccessToken()?.isNotEmpty ?? false;
  }

  @override
  Future<void> deleteAccessToken() async {
    await _localDataSource.deleteAccessToken();
  }
}
