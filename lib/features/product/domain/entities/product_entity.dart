import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int productId;
  final String name;

  const ProductEntity({
    required this.productId,
    required this.name,
  });

  @override
  List<Object?> get props => [productId];
}
