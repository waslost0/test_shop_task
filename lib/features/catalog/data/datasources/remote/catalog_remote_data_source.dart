import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/api/private_api.dart';
import 'package:test_shop_task/features/catalog/data/models/category.dart';
import 'package:test_shop_task/features/catalog/domain/entities/category_entity.dart';

part 'catalog_remote_data_source_impl.dart';

abstract class CatalogRemoteDataSource {
  Future<List<CategoryEntity>> list({required int offset});
}
