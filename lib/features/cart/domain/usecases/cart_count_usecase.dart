import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/usecases/usecase.dart';
import 'package:test_shop_task/features/cart/domain/repositories/cart_repository.dart';

@injectable
class CartCountUseCase implements UseCase<int, NoParams> {
  final CartRepository _cartRepository;

  CartCountUseCase(
    this._cartRepository,
  );

  @override
  Future<Either<AppFailure, int>> call(NoParams _) async {
    return await _cartRepository.getCount();
  }
}
