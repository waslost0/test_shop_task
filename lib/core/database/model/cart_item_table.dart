import 'package:drift/drift.dart';
import 'package:test_shop_task/core/database/model/product_table.dart';
import 'package:test_shop_task/features/cart/domain/entities/cart_entity.dart';

@UseRowClass(CartItemEntity)
class CartItemTable extends Table {
  @override
  Set<Column> get primaryKey => {productId};

  @override
  String get tableName => 'cart_item';

  IntColumn get count => integer()();

  IntColumn get productId => integer().references(ProductTable, #productId)();
}
