import 'package:equatable/equatable.dart';

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
