import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/di/injection.dart';
import 'package:test_shop_task/features/product/domain/usecases/product_detail_usecase.dart';
import 'package:test_shop_task/features/product/presentation/provider/state/product_detail_notifier.dart';
import 'package:test_shop_task/features/product/presentation/provider/state/product_detail_state.dart';

final productProvider = AutoDisposeStateNotifierProvider.family<
    ProductDetailNotifier, ProductDetailState, int>(
  (ref, productId) {
    return ProductDetailNotifier(
      getIt<LoadProductDetailUseCase>(),
      productId,
    )..loadProduct();
  },
);
