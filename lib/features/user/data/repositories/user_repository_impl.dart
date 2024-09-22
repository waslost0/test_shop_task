part of 'package:test_shop_task/features/user/domain/repositories/user_repository.dart';

@LazySingleton(
  as: UserRepository,
)
class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource _remoteDataSource;

  UserRepositoryImpl(
    this._remoteDataSource,
  );

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    try {
      final response = await _remoteDataSource.profile();
      return Right(response.toEntity());
    } catch (e, s) {
      return Left(
        ExceptionToFailureConverter.convert(e, s),
      );
    }
  }

  @override
  Future<Either<AppException, bool>> sendConfirmationCode({
    required String phone,
  }) async {
    ApiResponse? response;
    try {} catch (e, s) {}
    return const Right(false);
  }
}
