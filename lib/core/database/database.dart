import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/database/entities/cart_item_table.dart';
import 'package:test_shop_task/core/database/entities/product_table.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';

part 'database.g.dart';

@Singleton()
@DriftDatabase(tables: [ProductTable, CartItemTable])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/getting-started/#open
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    // `driftDatabase` from `package:drift_flutter` stores the database in
    // `getApplicationDocumentsDirectory()`.
    return driftDatabase(name: 'app_database');
  }
}
