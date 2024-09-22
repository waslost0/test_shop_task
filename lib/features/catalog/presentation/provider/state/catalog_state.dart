import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/params/list_params.dart';
import 'package:test_shop_task/features/catalog/domain/entities/category_entity.dart';

part 'catalog_state.freezed.dart';

@freezed
abstract class CatalogState with _$CatalogState {
  const factory CatalogState.initial({
    @Default([]) List<CategoryEntity> list,
    @Default(ListParams()) ListParams listParams,
  }) = Initial;

  const factory CatalogState.loading({
    @Default([]) List<CategoryEntity> list,
    @Default(ListParams()) ListParams listParams,
  }) = Loading;

  const factory CatalogState.failure({
    @Default([]) List<CategoryEntity> list,
    @Default(ListParams()) ListParams listParams,
    required Failure exception,
  }) = CatalogFailure;

  const factory CatalogState.success({
    required List<CategoryEntity> list,
    required ListParams listParams,
  }) = Success;
}
