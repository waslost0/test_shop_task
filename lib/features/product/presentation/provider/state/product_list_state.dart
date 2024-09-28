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
  const factory ProductListState.initial({
    @Default([]) List<ProductEntity> list,
    @Default(ProductListParams()) ProductListParams listParams,
  }) = Initial;

  const factory ProductListState.loading({
    @Default([]) List<ProductEntity> list,
    @Default(ProductListParams()) ProductListParams listParams,
  }) = Loading;

  const factory ProductListState.failure({
    @Default([]) List<ProductEntity> list,
    @Default(ProductListParams()) ProductListParams listParams,
    required AppFailure exception,
  }) = Failure;

  const factory ProductListState.success({
    required List<ProductEntity> list,
    required ProductListParams listParams,
  }) = Success;
}
