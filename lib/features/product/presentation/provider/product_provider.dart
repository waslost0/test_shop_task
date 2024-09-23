import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/di/injection.dart';
import 'package:test_shop_task/features/catalog/domain/entities/category_entity.dart';
import 'package:test_shop_task/features/product/domain/usecases/product_list_usecase.dart';
import 'package:test_shop_task/features/product/presentation/provider/state/product_notifier.dart';
import 'package:test_shop_task/features/product/presentation/provider/state/product_state.dart';

final productProvider = AutoDisposeStateNotifierProvider.family<ProductNotifier,
    ProductState, CategoryEntity?>(
  (ref, data) {
    return ProductNotifier(
      getIt<LoadProductUseCase>(),
      data,
    )..loginList();
  },
);
