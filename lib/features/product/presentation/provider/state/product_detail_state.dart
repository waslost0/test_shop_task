import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';

part 'product_detail_state.freezed.dart';

@freezed
abstract class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState.initial() = Initial;

  const factory ProductDetailState.loading() = Loading;

  const factory ProductDetailState.failure({
    required AppFailure exception,
  }) = Failure;

  const factory ProductDetailState.success({
    required ProductEntity product,
  }) = Success;
}
