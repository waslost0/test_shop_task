import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/usecases/usecase.dart';
import 'package:test_shop_task/features/user/domain/entities/user_entity.dart';
import 'package:test_shop_task/features/user/domain/repositories/user_repository.dart';

@injectable
class ChangeProfileUseCase implements UseCase<UserEntity, UserEntity> {
  final UserRepository _userRepository;

  const ChangeProfileUseCase(
    this._userRepository,
  );

  @override
  Future<Either<AppFailure, UserEntity>> call(UserEntity user) async {
    return await _userRepository.changeProfile(user);
  }
}
