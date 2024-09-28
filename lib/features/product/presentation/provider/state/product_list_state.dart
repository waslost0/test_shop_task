import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/params/list_params.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';

part 'product_list_state.freezed.dart';

class ProductListParams extends ListParams {
  final int? categoryId;

  const ProductListParams({
    super.limit,
    super.offset,
    super.searchString,
    this.categoryId,
  });

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
}

@freezed
abstract class ProductListState with _$ProductListState {
  const factory ProductListState({
    @Default([]) List<ProductEntity> list,
    AppFailure? exception,
    @Default(false) bool isLoading,
    @Default(false) bool isAllLoaded,
    @Default(ProductListParams()) ProductListParams listParams,
  }) = _ProductListState;
}

extension ProductListStateX on ProductListState {
  bool get hasError => exception?.message?.isNotEmpty ?? false;
  String? get searchString => listParams.searchString;
  String? get errorMessage => exception?.message;

}
