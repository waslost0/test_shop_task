import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/usecases/usecase.dart';
import 'package:test_shop_task/features/cart/domain/usecases/cart_add_update_usecase.dart';
import 'package:test_shop_task/features/cart/domain/usecases/cart_load_usecase.dart';
import 'package:test_shop_task/features/cart/presentation/provider/state/cart_state.dart';

class CartNotifier extends StateNotifier<CartState> {
  final CartLoadUseCase _loadList;
  final CartAddUpdateUseCase _addItem;

  CartNotifier(
    this._loadList,
    this._addItem,
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
}
