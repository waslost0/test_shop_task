import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/di/injection.dart';
import 'package:test_shop_task/features/cart/domain/usecases/cart_add_update_usecase.dart';
import 'package:test_shop_task/features/cart/domain/usecases/cart_load_usecase.dart';
import 'package:test_shop_task/features/cart/presentation/provider/state/cart_notifier.dart';
import 'package:test_shop_task/features/cart/presentation/provider/state/cart_state.dart';

final cartProvider = AutoDisposeStateNotifierProvider<CartNotifier, CartState>(
  (ref) {
    return CartNotifier(
      getIt<CartLoadUseCase>(),
      getIt<CartAddUpdateUseCase>(),
    )..loginList();
  },
);
