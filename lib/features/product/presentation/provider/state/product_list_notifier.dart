import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/features/catalog/domain/entities/category_entity.dart';
import 'package:test_shop_task/features/product/domain/usecases/product_list_usecase.dart';
import 'package:test_shop_task/features/product/presentation/provider/state/product_list_state.dart';

class ProductListNotifier extends StateNotifier<ProductListState> {
  final LoadProductListUseCase _loadList;

  ProductListNotifier(
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
      (l) => ProductListState.failure(exception: l),
      (r) => ProductListState.success(
        list: [...state.list, ...r],
        listParams: state.listParams.copyWith(
          offset: state.listParams.offset + r.length,
        ),
      ),
    );
  }

  Future<void> reloadData({String? searchString}) async {
    state = state.copyWith(
      listParams: ProductListParams(
        categoryId: state.listParams.categoryId,
        searchString: searchString ?? state.listParams.searchString,
      ),
    );
    final result = await _loadList.call(
      state.listParams,
    );

    state = await result.fold(
      (l) => ProductListState.failure(exception: l),
      (r) => ProductListState.success(
        list: r,
        listParams: state.listParams.copyWith(
          offset: state.listParams.offset + r.length,
        ),
      ),
    );
  }
}
