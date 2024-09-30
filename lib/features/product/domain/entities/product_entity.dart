import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_shop_task/core/database/database.dart';
import 'package:test_shop_task/core/model/custom_file.dart';

part 'product_entity.freezed.dart';

@freezed
class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required int productId,
    required String name,
    String? imageUrl,
    String? productDescription,
    double? price,
    @Default(false) bool isFavorite,
    @Default([]) List<CustomFile> images,
  }) = _ProductEntity;
}

extension ProductEntityDbExtensions on ProductEntity {
  ProductTableCompanion toCompanion() {
    return ProductTableCompanion(
      productId: drift.Value(productId),
      name: drift.Value(name),
      imageUrl: drift.Value.absentIfNull(imageUrl),
      images: drift.Value.absentIfNull(images),
      price: drift.Value.absentIfNull(price?.toDouble()),
      productDescription: drift.Value.absentIfNull(productDescription),
    );
  }
}
