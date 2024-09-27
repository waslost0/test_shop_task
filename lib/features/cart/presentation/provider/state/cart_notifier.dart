import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/usecases/usecase.dart';
import 'package:test_shop_task/features/cart/domain/usecases/cart_add_update_usecase.dart';
import 'package:test_shop_task/features/cart/domain/usecases/cart_clear_usecase.dart';
import 'package:test_shop_task/features/cart/domain/usecases/cart_count_usecase.dart';
import 'package:test_shop_task/features/cart/domain/usecases/cart_delete_usecase.dart';
import 'package:test_shop_task/features/cart/domain/usecases/cart_load_usecase.dart';
import 'package:test_shop_task/features/cart/domain/usecases/cart_remove_usecase.dart';
import 'package:test_shop_task/features/cart/presentation/provider/state/cart_state.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';

class CartNotifier extends StateNotifier<CartState> {
  final CartLoadUseCase _loadList;
  final CartAddUpdateUseCase _addItem;
  final CartRemoveUseCase _removeItem;
  final CartDeleteUseCase _deleteItem;
  final CartClearUseCase _clearCart;
  final CartCountUseCase _cartCount;

  CartNotifier(
    this._loadList,
    this._addItem,
    this._removeItem,
    this._deleteItem,
    this._clearCart,
    this._cartCount,
  ) : super(const Loading());

  Future<void> loadList({bool reload = false}) async {
    if (state.list.isEmpty || reload) {
      state = const Loading();
    }

    final result = await _loadList.call(NoParams());

    state = await result.fold(
      (l) => CartState.failure(exception: l),
      (r) => CartState.success(
        list: reload ? r : [...state.list, ...r],
      ),
    );
  }

  Future<void> increaseItem(int index) async {
    final cartItem = state.list[index];
    if (cartItem.product == null) return;
    final result = await _addItem.call(cartItem.product!);

    state = await result.fold(
      (l) => CartState.failure(exception: l),
      (r) {
        final list = state.list.toList();
        list[index] = r;
        return Success(list: list);
      },
    );
  }

  Future<void> addProduct(ProductEntity product) async {
    final result = await _addItem.call(product);

    result.fold(
      (l) => Failure(exception: l),
      (r) async {
        await loadList(reload: true);
      },
    );
  }

  Future<void> decrementItem(int index) async {
    final cartItem = state.list[index];
    if (cartItem.product == null) return;
    final result = await _removeItem.call(cartItem.product!);

    state = await result.fold(
      (l) => CartState.failure(exception: l),
      (r) {
        final list = state.list.toList();
        if (r != null) {
          list[index] = r;
        } else {
          list.removeAt(index);
        }
        return Success(list: list);
      },
    );
  }

  Future<void> deleteItem(int index) async {
    final cartItem = state.list[index];
    final result = await _deleteItem.call(cartItem);

    state = await result.fold(
      (l) => Failure(exception: l),
      (r) {
        final list = state.list.toList();
        list.removeAt(index);
        return Success(list: list);
      },
    );
  }

  Future<int?> cartItemCountCount() async {
    final result = await _cartCount.call(NoParams());
    return result.fold(
      (l) => null,
      (r) => r,
    );
  }

  Future<void> clearCart() async {
    final result = await _clearCart.call(NoParams());

    state = await result.fold(
      (l) => Failure(exception: l),
      (r) => const Success(list: []),
    );
  }

  double totalPrice() {
    return state.list.fold(
      0.0,
      (previousValue, element) => previousValue + (element.product?.price ?? 0),
    );
  }

  int productCount() {
    return state.list.fold(
      0,
      (previousValue, element) => previousValue + element.count,
    );
  }
}
