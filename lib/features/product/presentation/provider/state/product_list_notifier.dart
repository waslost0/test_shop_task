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
          ProductListState(
            listParams: ProductListParams(categoryId: category?.categoryId),
            isLoading: true,
          ),
        );

  Future<void> loadList() async {
    if (state.isAllLoaded) return;
    state = state.copyWith(isLoading: true);

    final result = await _loadList.call(
      state.listParams,
    );

    state = await result.fold(
      (l) => state.copyWith(exception: l),
      (r) {
        return state.copyWith(
          list: [...state.list, ...r],
          isAllLoaded: r.isEmpty,
          isLoading: false,
          listParams: state.listParams.copyWith(
            offset: state.listParams.offset + r.length,
          ),
        );
      },
    );
  }

  Future<void> reloadData({String? searchString}) async {
    state = ProductListState(isLoading: true, list: state.list);
    final result = await _loadList.call(
      state.listParams,
    );

    state = await result.fold(
      (l) => ProductListState(exception: l),
      (r) => ProductListState(
        list: r,
        listParams: state.listParams.copyWith(
          offset: state.listParams.offset + r.length,
        ),
      ),
    );
  }
}
