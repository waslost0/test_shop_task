

import 'package:drift/drift.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';

@UseRowClass(ProductEntity)
class ProductTable extends Table {
  IntColumn get productId => integer()();

  TextColumn get name => text().withLength(min: 6, max: 32)();

  TextColumn get productDescription => text().nullable()();
}
