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
  Future<Either<AppFailure, List<CartItemEntity>>> getList({
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
      log('Loaded cart items $cartItems}');
      return Right(cartItems);
    } catch (e, s) {
      return Left(
        ExceptionToFailureConverter.convert(e, s),
      );
    }
  }

  @override
  Future<Either<AppFailure, CartItemEntity?>> getCartItemByProductId({
    required int productId,
  }) async {
    try {
      final cartItem = await _db.managers.cartItemTable
          .filter((f) => f.productId.productId.equals(productId))
          .getSingleOrNull();
      return Right(cartItem);
    } catch (e, s) {
      return Left(
        ExceptionToFailureConverter.convert(e, s),
      );
    }
  }

  @override
  Future<Either<AppFailure, CartItemEntity?>> getCartItemByProductIdRef({
    required int productId,
  }) async {
    try {
      CartItemEntity? cartItem;
      final response = await _db.managers.cartItemTable
          .filter((f) {
            return f.productId.productId.equals(productId);
          })
          .withReferences((prefetch) => prefetch(productId: true))
          .getSingleOrNull();

      cartItem = response?.$1.copyWith(
        product: await response.$2.productId?.getSingle(),
      );

      return Right(cartItem);
    } catch (e, s) {
      return Left(
        ExceptionToFailureConverter.convert(e, s),
      );
    }
  }

  @override
  Future<Either<AppFailure, CartItemEntity>> addCartItem({
    required CartItemEntity cartItem,
  }) async {
    try {
      await _db.transaction(() async {
        if (cartItem.product != null) {
          await _db
              .into(_db.productTable)
              .insertOnConflictUpdate(cartItem.product!.toCompanion());
        }
        await _db
            .into(_db.cartItemTable)
            .insertOnConflictUpdate(cartItem.toCompanion());
      });
      return Right(cartItem);
    } catch (e, s) {
      return Left(
        ExceptionToFailureConverter.convert(e, s),
      );
    }
  }

  @override
  Future<Either<AppFailure, bool>> removeCartItem({
    required CartItemEntity cartItem,
  }) async {
    try {
      await _db.transaction(() async {
        await _db.managers.productTable
            .filter((f) => f.productId(cartItem.productId))
            .delete();

        await _db.managers.cartItemTable
            .filter((f) => f.productId.productId(cartItem.productId))
            .delete();
      });
      return const Right(true);
    } catch (e, s) {
      return Left(
        ExceptionToFailureConverter.convert(e, s),
      );
    }
  }
}
