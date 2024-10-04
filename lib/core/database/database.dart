import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/database/db_interceptopr.dart';
import 'package:test_shop_task/core/database/model/cart_item_table.dart';
import 'package:test_shop_task/core/database/model/product_table.dart';
import 'package:test_shop_task/core/model/config.dart';
import 'package:test_shop_task/core/model/custom_file.dart';
import 'package:test_shop_task/features/cart/domain/entities/cart_entity.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';
import 'package:universal_io/io.dart';

part 'database.g.dart';

/// Singleton class representing the application's database using Drift.
///
/// This class defines the database schema, including tables for products and cart items.
@Singleton()
@DriftDatabase(tables: [ProductTable, CartItemTable])
class AppDatabase extends _$AppDatabase {
  /// Constructor initializes the database connection.
  AppDatabase() : super(_openConnection());

  /// Returns the schema version of the database.
  @override
  int get schemaVersion => 1;

  /// Opens a connection to the database.
  ///
  /// Determines the database path based on the platform (Windows, macOS, Linux, or others).
  /// Uses DriftNativeOptions for native platforms and provides a custom path to the 'sqlite3.so' file.
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

    if (Config.dbLoggerEnabled) {
      return db.interceptWith(DbLogInterceptor());
    }
    return db;
  }
}