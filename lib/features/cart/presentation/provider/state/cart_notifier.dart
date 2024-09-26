import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/usecases/usecase.dart';
import 'package:test_shop_task/features/cart/domain/usecases/cart_add_update_usecase.dart';
import 'package:test_shop_task/features/cart/domain/usecases/cart_load_usecase.dart';
import 'package:test_shop_task/features/cart/domain/usecases/cart_remove_usecase.dart';
import 'package:test_shop_task/features/cart/presentation/provider/state/cart_state.dart';

class CartNotifier extends StateNotifier<CartState> {
  final CartLoadUseCase _loadList;
  final CartAddUpdateUseCase _addItem;
  final CartRemoveUseCase _removeItem;

  CartNotifier(
    this._loadList,
    this._addItem,
    this._removeItem,
  ) : super(const Loading());

  Future<void> loginList() async {
    if (state.list.isEmpty) {
      state = const Loading();
    }

    final result = await _loadList.call(NoParams());

    state = await result.fold(
      (l) => CartState.failure(exception: l),
      (r) => CartState.success(
        list: [...state.list, ...r],
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
}
