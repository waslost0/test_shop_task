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
  Future<Either<AppFailure, UserEntity>> getUser() async {
    try {
      final response = await _remoteDataSource.profile();
      return Right(response.toEntity());
    } catch (e, s) {
      return Left(
        ExceptionToFailureConverter.convert(e, s),
      );
    }
  }
}
