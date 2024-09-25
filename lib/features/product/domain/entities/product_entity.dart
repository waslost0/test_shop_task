import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:test_shop_task/core/database/database.dart';

class ProductEntity extends Equatable {
  final int productId;
  final String name;
  final String? imageUrl;
  final List<String> images;
  final String? productDescription;
  final num? price;
  final bool isFavorite;

  const ProductEntity({
    required this.productId,
    required this.name,
    this.imageUrl,
    this.productDescription,
    this.price,
    this.isFavorite = false,
    this.images = const [],
  });

  @override
  List<Object?> get props => [productId];
}

extension ProductEntityDbExtensions on ProductEntity {
  ProductTableCompanion toCompanion() {
    return ProductTableCompanion(
      productId: Value(productId),
      name: Value(name),
      imageUrl: Value.absentIfNull(imageUrl),
      images: Value.absentIfNull(images),
      price: Value.absentIfNull(price?.toDouble()),
      productDescription: Value.absentIfNull(productDescription),
    );
  }
}
