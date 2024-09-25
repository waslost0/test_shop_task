import 'package:drift/drift.dart';
import 'package:test_shop_task/core/database/entities/product_table.dart';

class CartItemTable extends Table {
  @override
  String get tableName => 'cart_item';

  IntColumn get id => integer().autoIncrement()();

  IntColumn get count => integer()();

  IntColumn get productId => integer().references(ProductTable, #productId)();
}
