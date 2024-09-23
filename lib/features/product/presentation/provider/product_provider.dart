import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/di/injection.dart';
import 'package:test_shop_task/features/product/domain/usecases/product_list_usecase.dart';
import 'package:test_shop_task/features/product/presentation/provider/state/product_notifier.dart';
import 'package:test_shop_task/features/product/presentation/provider/state/product_state.dart';

final productProvider = StateNotifierProvider<ProductNotifier, ProductState>(
  (ref) {
    return ProductNotifier(
      getIt<LoadProductUseCase>(),
    );
  },
);
