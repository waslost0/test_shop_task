import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/usecases/usecase.dart';
import 'package:test_shop_task/features/cart/domain/entities/cart_entity.dart';
import 'package:test_shop_task/features/cart/domain/repositories/cart_repository.dart';

@injectable
class CartAddUpdateUseCase implements UseCase<bool, CartItemEntity> {
  final CartRepository _cartRepository;

  CartAddUpdateUseCase(
    this._cartRepository,
  );

  @override
  Future<Either<AppFailure, bool>> call(CartItemEntity item) async {
    return await _cartRepository.addCartItem(
      cartItem: item,
    );
  }
}
