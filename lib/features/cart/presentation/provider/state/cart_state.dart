import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/features/cart/domain/entities/cart_entity.dart';

part 'cart_state.freezed.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState.initial({
    @Default([]) List<CartItemEntity> list,
  }) = Initial;

  const factory CartState.loading({
    @Default([]) List<CartItemEntity> list,
  }) = Loading;

  const factory CartState.failure({
    @Default([]) List<CartItemEntity> list,
    required AppFailure exception,
  }) = Failure;

  const factory CartState.success({
    required List<CartItemEntity> list,
  }) = Success;
}
