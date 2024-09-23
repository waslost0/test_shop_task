import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/features/catalog/domain/entities/category_entity.dart';
import 'package:test_shop_task/features/product/domain/usecases/product_list_usecase.dart';
import 'package:test_shop_task/features/product/presentation/provider/state/product_state.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  final LoadProductUseCase loadList;

  ProductNotifier(
    this.loadList,
  ) : super(const Initial());

  Future<void> loginList({
    CategoryEntity? category,
  }) async {
    if (state.list.isEmpty) {
      state = Loading(listParams: state.listParams);
    }

    final result = await loadList.call(
      state.listParams,
    );

    state = await result.fold(
      (l) => ProductState.failure(exception: l),
      (r) => ProductState.success(
        list: [...state.list, ...r],
        listParams: ProductListParams(
          offset: state.listParams.offset + r.length,
        ),
      ),
    );
  }

  Future<void> reloadData() async {
    state = state.copyWith(listParams: const ProductListParams());

    final result = await loadList.call(
      const ProductListParams(),
    );

    state = await result.fold(
      (l) => ProductState.failure(exception: l),
      (r) => ProductState.success(
        list: r,
        listParams: state.listParams.copyWith(
          offset: state.listParams.offset + r.length,
        ),
      ),
    );
  }
}
