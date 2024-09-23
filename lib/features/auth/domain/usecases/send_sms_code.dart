import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/usecases/usecase.dart';
import 'package:test_shop_task/features/auth/domain/entities/auth_params.dart';
import 'package:test_shop_task/features/auth/domain/repositories/auth_repository.dart';

@injectable
class SendSmsCodeUseCase implements UseCase<bool, SendSmsCodeParams> {
  final AuthRepository _authRepository;

  const SendSmsCodeUseCase(this._authRepository);

  @override
  Future<Either<Failure, bool>> call(SendSmsCodeParams params) async {
    return await _authRepository.sendSmsCode(phone: params.phone);
  }
}
