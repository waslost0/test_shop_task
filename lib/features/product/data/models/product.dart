import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_shop_task/core/utils/json_converter.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int productId,
    required String name,
    required int createdAt,
    double? price,
    String? imageUrl,
    String? productDescription,
    num? rating,
    @BoolJsonConverter() @Default(false) bool isFavorite,
    @Default([]) List<String> images,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

extension ProductX on Product {
  ProductEntity toEntity() {
    return ProductEntity(
      productId: productId,
      name: name,
      images: images,
      imageUrl: imageUrl,
      isFavorite: isFavorite,
      price: price,
      productDescription: productDescription,
    );
  }
}
