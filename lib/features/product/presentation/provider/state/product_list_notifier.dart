import 'package:test_shop_task/core/provider/base_list_provider.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';
import 'package:test_shop_task/features/product/domain/usecases/product_list_usecase.dart';
import 'package:test_shop_task/features/product/presentation/provider/state/product_list_state.dart';

class ProductListNotifier
    extends BaseListStateProvider<ProductListState, ProductEntity> {
  final LoadProductListUseCase _loadList;

  ProductListNotifier(
    this._loadList,
    int? categoryId,
  ) : super(
          ProductListState(
            listParams: ProductListParams(categoryId: categoryId),
            isLoading: false,
          ),
        );

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
