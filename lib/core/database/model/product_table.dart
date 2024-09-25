import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';

@UseRowClass(ProductEntity)
class ProductTable extends Table {
  @override
  String get tableName => 'product';

  IntColumn get id => integer().autoIncrement()();

  IntColumn get productId => integer()();

  TextColumn get name => text()();

  TextColumn get productDescription => text().nullable()();

  TextColumn get imageUrl => text().nullable()();

  RealColumn get price => real().nullable()();

  TextColumn get images => text().map(const JsonStringListConverter())();
}

class JsonStringListConverter extends TypeConverter<List<String>, String> {
  const JsonStringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    return (jsonDecode(fromDb) as List).cast<String>();
  }

  @override
  String toSql(List<String> value) {
    return jsonEncode(value);
  }
}
