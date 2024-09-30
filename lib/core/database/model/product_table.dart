import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:test_shop_task/core/model/custom_file.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';

@UseRowClass(ProductEntity)
class ProductTable extends Table {
  @override
  String get tableName => 'product';

  @override
  Set<Column> get primaryKey => {productId};

  IntColumn get productId => integer()();

  TextColumn get name => text()();

  TextColumn get productDescription => text().nullable()();

  TextColumn get imageUrl => text().nullable()();

  RealColumn get price => real().nullable()();

  // TODO: temp solution, in future create separate table
  TextColumn get images => text().map(const JsonStringListConverter())();
}

class JsonStringListConverter extends TypeConverter<List<CustomFile>, String> {
  const JsonStringListConverter();

  @override
  List<CustomFile> fromSql(String fromDb) {
    return (jsonDecode(fromDb) as List)
        .map((e) => CustomFile.fromJson(e))
        .toList();
  }

  @override
  String toSql(List<CustomFile> value) {
    return jsonEncode(value);
  }
}
