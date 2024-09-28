import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/database/db_interceptopr.dart';
import 'package:test_shop_task/core/database/model/cart_item_table.dart';
import 'package:test_shop_task/core/database/model/product_table.dart';
import 'package:test_shop_task/features/cart/domain/entities/cart_entity.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';
import 'package:universal_io/io.dart';

part 'database.g.dart';

@Singleton()
@DriftDatabase(tables: [ProductTable, CartItemTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    String? dataBasePath;
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      final script = File(Platform.script.toFilePath());
      dataBasePath = '${script.path}/sqlite3.so';
    }

    final db = driftDatabase(
      name: 'app_database',
      native: dataBasePath != null
          ? DriftNativeOptions(databasePath: () async => dataBasePath!)
          : null,
    );

    if (kDebugMode) {
      return db.interceptWith(DbLogInterceptor());
    }
    return db;
  }
}
