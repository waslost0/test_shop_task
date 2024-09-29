import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/di/injection.dart';
import 'package:test_shop_task/features/product/domain/usecases/product_list_usecase.dart';
import 'package:test_shop_task/features/product/presentation/provider/state/product_list_notifier.dart';
import 'package:test_shop_task/features/product/presentation/provider/state/product_list_state.dart';

final productListProvider = AutoDisposeStateNotifierProvider.family<
    ProductListNotifier, ProductListState, int?>(
  (ref, categoryId) {
    return ProductListNotifier(
      getIt<LoadProductListUseCase>(),
        categoryId
    )..loadData();
  },
);
