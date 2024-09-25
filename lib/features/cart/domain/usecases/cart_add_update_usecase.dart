import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/usecases/usecase.dart';
import 'package:test_shop_task/features/cart/domain/entities/cart_entity.dart';
import 'package:test_shop_task/features/cart/domain/repositories/cart_repository.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';

@injectable
class CartAddUpdateUseCase implements UseCase<bool, ProductEntity> {
  final CartRepository _cartRepository;

  CartAddUpdateUseCase(
    this._cartRepository,
  );

  @override
  Future<Either<AppFailure, bool>> call(ProductEntity item) async {
    final result = await _cartRepository.getCartItemByProductId(
      productId: item.productId,
    );
    if (result is Left) {
      return Left((result as Left).value);
    }

    CartItemEntity? cartDbItem = (result as Right).value;
    if (cartDbItem != null) {
      cartDbItem = cartDbItem.copyWith(count: cartDbItem.count + 1);
    }
    cartDbItem ??= CartItemEntity(
      count: 1,
      productId: item.productId,
      product: item,
    );
    return await _cartRepository.addCartItem(cartItem: cartDbItem);
  }
}
