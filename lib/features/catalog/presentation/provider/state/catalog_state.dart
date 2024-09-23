import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/params/list_params.dart';
import 'package:test_shop_task/features/catalog/domain/entities/category_entity.dart';

part 'catalog_state.freezed.dart';

class CategoryListParams extends ListParams {
  final int? parentId;

  const CategoryListParams({
    super.limit,
    super.offset,
    this.parentId,
  });

  CategoryListParams copyWith({
    int? offset,
    int? limit,
    int? parentId,
  }) {
    return CategoryListParams(
      parentId: parentId ?? this.parentId,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
    );
  }
}

@freezed
abstract class CatalogState with _$CatalogState {
  const factory CatalogState.initial({
    @Default([]) List<CategoryEntity> list,
    @Default(CategoryListParams()) CategoryListParams listParams,
  }) = Initial;

  const factory CatalogState.loading({
    @Default([]) List<CategoryEntity> list,
    @Default(CategoryListParams()) CategoryListParams listParams,
  }) = Loading;

  const factory CatalogState.failure({
    @Default([]) List<CategoryEntity> list,
    @Default(CategoryListParams()) CategoryListParams listParams,
    required Failure exception,
  }) = CatalogFailure;

  const factory CatalogState.success({
    required List<CategoryEntity> list,
    required CategoryListParams listParams,
  }) = Success;
}
