import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/features/product/domain/usecases/product_detail_usecase.dart';
import 'package:test_shop_task/features/product/presentation/provider/state/product_detail_state.dart';

class ProductDetailNotifier extends StateNotifier<ProductDetailState> {
  final LoadProductDetailUseCase _loadProduct;
  final int productId;

  ProductDetailNotifier(
    this._loadProduct,
    this.productId,
  ) : super(const ProductDetailState.initial());

  Future<void> loadProduct() async {
    state = const Loading();

    final result = await _loadProduct.call(productId);

    state = await result.fold(
      (l) => Failure(exception: l),
      (r) => Success(product: r),
    );
  }
}
