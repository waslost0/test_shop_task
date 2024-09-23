import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int productId;
  final String name;
  final String? imageUrl;

  const ProductEntity({
    required this.productId,
    required this.name,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [productId];
}
