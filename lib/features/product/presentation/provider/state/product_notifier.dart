import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/features/catalog/domain/entities/category_entity.dart';
import 'package:test_shop_task/features/product/domain/usecases/product_list_usecase.dart';
import 'package:test_shop_task/features/product/presentation/provider/state/product_state.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  final LoadProductUseCase _loadList;

  ProductNotifier(
    this._loadList,
    CategoryEntity? category,
  ) : super(
          Loading(
            listParams: ProductListParams(categoryId: category?.categoryId),
          ),
        );

  Future<void> loginList() async {
    if (state.list.isEmpty) {
      state = Loading(listParams: state.listParams);
    }

    final result = await _loadList.call(
      state.listParams,
    );

    state = await result.fold(
      (l) => ProductState.failure(exception: l),
      (r) => ProductState.success(
        list: [...state.list, ...r],
        listParams: state.listParams.copyWith(
          offset: state.listParams.offset + r.length,
        ),
      ),
    );
  }

  Future<void> reloadData() async {
    state = state.copyWith(
      listParams: ProductListParams(
        categoryId: state.listParams.categoryId,
      ),
    );

    final result = await _loadList.call(
      state.listParams,
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
