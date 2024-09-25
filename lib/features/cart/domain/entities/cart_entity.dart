import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_shop_task/core/database/database.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';

part 'cart_entity.freezed.dart';

@freezed
class CartItemEntity with _$CartItemEntity {
  const factory CartItemEntity({
    required int count,
    required int productId,
    ProductEntity? product,
  }) = _CartItemEntity;
}

extension CartEntityDbExtensions on CartItemEntity {
  CartItemTableCompanion toCompanion() {
    return CartItemTableCompanion(
      count: drift.Value(count),
      productId: drift.Value(productId),
    );
  }
}
