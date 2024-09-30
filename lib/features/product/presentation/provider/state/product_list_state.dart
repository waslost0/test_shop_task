import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/params/list_params.dart';
import 'package:test_shop_task/core/satates/base_list_state.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';

class ProductListParams extends ListParams {
  final int? categoryId;

  const ProductListParams({
    super.limit,
    super.offset,
    super.searchString,
    this.categoryId,
  });

  @override
  ProductListParams copyWith({
    int? offset,
    int? limit,
    int? categoryId,
    String? searchString,
  }) {
    return ProductListParams(
      categoryId: categoryId ?? this.categoryId,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
      searchString: searchString ?? this.searchString,
    );
  }

  static ProductListParams fromListParams(
    ListParams? listParams,
  ) {
    return ProductListParams(
      limit: listParams?.limit ?? 10,
      offset: listParams?.offset ?? 0,
      searchString: listParams?.searchString,
    );
  }
}

class ProductListState extends BaseListState<ProductEntity> {
  @override
  ProductListParams get listParams => super.listParams as ProductListParams;

  ProductListState({
    super.items,
    super.exception,
    super.isLoading,
    super.isFullReloading,
    super.isAllLoaded,
    super.listParams = const ProductListParams(),
  });

  @override
  ProductListState copyWith({
    bool? isLoading,
    bool? isAllLoaded,
    bool? isFullReloading,
    ListParams? listParams,
    List<ProductEntity>? items,
    AppFailure? exception,
  }) {
    return ProductListState(
      isFullReloading: isFullReloading ?? this.isFullReloading,
      isLoading: isLoading ?? this.isLoading,
      isAllLoaded: isAllLoaded ?? this.isAllLoaded,
      listParams: listParams ?? this.listParams,
      items: items ?? this.items,
      exception: exception ?? this.exception,
    );
  }
}
