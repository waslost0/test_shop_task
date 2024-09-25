import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/usecases/usecase.dart';
import 'package:test_shop_task/features/auth/data/models/auth_response.dart';
import 'package:test_shop_task/features/auth/domain/entities/auth_params.dart';
import 'package:test_shop_task/features/auth/domain/repositories/auth_repository.dart';

@injectable
class LoginByPhoneCodeUseCase implements UseCase<AuthResponse, AuthParams> {
  final AuthRepository _authRepository;

  const LoginByPhoneCodeUseCase(this._authRepository);

  @override
  Future<Either<AppFailure, AuthResponse>> call(AuthParams params) async {
    return await _authRepository.login(
      phone: params.phone,
      code: params.code,
    );
  }
}
