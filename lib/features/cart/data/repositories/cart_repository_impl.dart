part of 'package:test_shop_task/features/cart/domain/repositories/cart_repository.dart';

@LazySingleton(
  as: CartRepository,
)
class CartRepositoryImpl extends CartRepository {
  final AppDatabase _db;

  CartRepositoryImpl(
    this._db,
  );

  @override
  Future<Either<Failure, List<CartItemEntity>>> getList({
    int offset = 0,
    int? parentId,
  }) async {
    try {
      final response = await _db.managers.cartItemTable
          .withReferences((prefetch) => prefetch(productId: true))
          .get();
      List<CartItemEntity> cartItems = [];
      for (final (cartItem, refs) in response) {
        final product = await refs.productId?.getSingle();
        var item = cartItem.copyWith(product: product);
        cartItems.add(item);
      }
      return Right(cartItems);
    } catch (e, s) {
      return Left(
        ExceptionToFailureConverter.convert(e, s),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> addCartItem({
    required CartItemEntity cartItem,
  }) async {
    try {
      await _db.transaction(() async {
        await _db
            .into(_db.productTable)
            .insertOnConflictUpdate(cartItem.product!.toCompanion());
        await _db
            .into(_db.cartItemTable)
            .insertOnConflictUpdate(cartItem.toCompanion());
      });
      return const Right(true);
    } catch (e, s) {
      return Left(
        ExceptionToFailureConverter.convert(e, s),
      );
    }
  }
}
