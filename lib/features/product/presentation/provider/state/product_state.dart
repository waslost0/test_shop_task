import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/params/list_params.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';

part 'product_state.freezed.dart';

class ProductListParams extends ListParams {
  final int? categoryId;

  const ProductListParams({
    super.limit,
    super.offset,
    this.categoryId,
  });

  ProductListParams copyWith({
    int? offset,
    int? limit,
    int? categoryId,
  }) {
    return ProductListParams(
      categoryId: categoryId ?? this.categoryId,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
    );
  }
}

@freezed
abstract class ProductState with _$ProductState {
  const factory ProductState.initial({
    @Default([]) List<ProductEntity> list,
    @Default(ProductListParams()) ProductListParams listParams,
  }) = Initial;

  const factory ProductState.loading({
    @Default([]) List<ProductEntity> list,
    @Default(ProductListParams()) ProductListParams listParams,
  }) = Loading;

  const factory ProductState.failure({
    @Default([]) List<ProductEntity> list,
    @Default(ProductListParams()) ProductListParams listParams,
    required AppFailure exception,
  }) = Failure;

  const factory ProductState.success({
    required List<ProductEntity> list,
    required ProductListParams listParams,
  }) = Success;
}
