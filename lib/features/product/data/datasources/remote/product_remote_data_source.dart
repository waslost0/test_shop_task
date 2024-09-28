import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/api/private_api.dart';
import 'package:test_shop_task/features/product/data/models/product.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';

part 'product_remote_data_source_impl.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductEntity>> list({
    required int offset,
    int? categoryId,
    String? searchString,
  });

  Future<ProductEntity> product({required int productId});
}
