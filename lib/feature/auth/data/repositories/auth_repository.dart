part of 'auth_repository_impl.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> login({
    required String phone,
    required String code,
  });
}
