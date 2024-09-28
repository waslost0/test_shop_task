import 'package:test_shop_task/core/provider/base_list_provider.dart';
import 'package:test_shop_task/features/catalog/domain/entities/category_entity.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';
import 'package:test_shop_task/features/product/domain/usecases/product_list_usecase.dart';
import 'package:test_shop_task/features/product/presentation/provider/state/product_list_state.dart';

class ProductListNotifier
    extends BaseListStateProvider<ProductListState, ProductEntity> {
  final LoadProductListUseCase _loadList;

  ProductListNotifier(
    this._loadList,
    CategoryEntity? category,
  ) : super(
          ProductListState(
            listParams: ProductListParams(categoryId: category?.categoryId),
            isLoading: false,
          ),
        );

  Future<void> reloadData({String? searchString}) async {
    state = ProductListState(isLoading: true, items: state.items);
    final result = await _loadList.call(
      state.listParams,
    );

    state = await result.fold(
      (l) => ProductListState(exception: l),
      (r) => ProductListState(
        items: r,
        listParams: state.listParams.copyWith(
          offset: state.listParams.offset + r.length,
        ),
      ),
    );
  }

  @override
  Future<void> loadNextItems() async {
    final result = await _loadList.call(
      state.listParams,
    );

    result.fold(
      (l) => state.copyWith(exception: l),
      (r) => onNextItemsLoaded(r),
    );
  }
}
