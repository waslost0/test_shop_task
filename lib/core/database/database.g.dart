// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProductTableTable extends ProductTable
    with TableInfo<$ProductTableTable, ProductEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _productDescriptionMeta =
      const VerificationMeta('productDescription');
  @override
  late final GeneratedColumn<String> productDescription =
      GeneratedColumn<String>('product_description', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [productId, name, productDescription];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_table';
  @override
  VerificationContext validateIntegrity(Insertable<ProductEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('product_description')) {
      context.handle(
          _productDescriptionMeta,
          productDescription.isAcceptableOrUnknown(
              data['product_description']!, _productDescriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ProductEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductEntity(
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      productDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}product_description']),
    );
  }

  @override
  $ProductTableTable createAlias(String alias) {
    return $ProductTableTable(attachedDatabase, alias);
  }
}

class ProductTableCompanion extends UpdateCompanion<ProductEntity> {
  final Value<int> productId;
  final Value<String> name;
  final Value<String?> productDescription;
  final Value<int> rowid;
  const ProductTableCompanion({
    this.productId = const Value.absent(),
    this.name = const Value.absent(),
    this.productDescription = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductTableCompanion.insert({
    required int productId,
    required String name,
    this.productDescription = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : productId = Value(productId),
        name = Value(name);
  static Insertable<ProductEntity> custom({
    Expression<int>? productId,
    Expression<String>? name,
    Expression<String>? productDescription,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (name != null) 'name': name,
      if (productDescription != null) 'product_description': productDescription,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductTableCompanion copyWith(
      {Value<int>? productId,
      Value<String>? name,
      Value<String?>? productDescription,
      Value<int>? rowid}) {
    return ProductTableCompanion(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      productDescription: productDescription ?? this.productDescription,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (productDescription.present) {
      map['product_description'] = Variable<String>(productDescription.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductTableCompanion(')
          ..write('productId: $productId, ')
          ..write('name: $name, ')
          ..write('productDescription: $productDescription, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductTableTable productTable = $ProductTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [productTable];
}

typedef $$ProductTableTableCreateCompanionBuilder = ProductTableCompanion
    Function({
  required int productId,
  required String name,
  Value<String?> productDescription,
  Value<int> rowid,
});
typedef $$ProductTableTableUpdateCompanionBuilder = ProductTableCompanion
    Function({
  Value<int> productId,
  Value<String> name,
  Value<String?> productDescription,
  Value<int> rowid,
});

class $$ProductTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ProductTableTable> {
  $$ProductTableTableFilterComposer(super.$state);
  ColumnFilters<int> get productId => $state.composableBuilder(
      column: $state.table.productId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get productDescription => $state.composableBuilder(
      column: $state.table.productDescription,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ProductTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ProductTableTable> {
  $$ProductTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get productId => $state.composableBuilder(
      column: $state.table.productId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get productDescription => $state.composableBuilder(
      column: $state.table.productDescription,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$ProductTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductTableTable,
    ProductEntity,
    $$ProductTableTableFilterComposer,
    $$ProductTableTableOrderingComposer,
    $$ProductTableTableCreateCompanionBuilder,
    $$ProductTableTableUpdateCompanionBuilder,
    (
      ProductEntity,
      BaseReferences<_$AppDatabase, $ProductTableTable, ProductEntity>
    ),
    ProductEntity,
    PrefetchHooks Function()> {
  $$ProductTableTableTableManager(_$AppDatabase db, $ProductTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ProductTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ProductTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> productId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> productDescription = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductTableCompanion(
            productId: productId,
            name: name,
            productDescription: productDescription,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int productId,
            required String name,
            Value<String?> productDescription = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductTableCompanion.insert(
            productId: productId,
            name: name,
            productDescription: productDescription,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProductTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductTableTable,
    ProductEntity,
    $$ProductTableTableFilterComposer,
    $$ProductTableTableOrderingComposer,
    $$ProductTableTableCreateCompanionBuilder,
    $$ProductTableTableUpdateCompanionBuilder,
    (
      ProductEntity,
      BaseReferences<_$AppDatabase, $ProductTableTable, ProductEntity>
    ),
    ProductEntity,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductTableTableTableManager get productTable =>
      $$ProductTableTableTableManager(_db, _db.productTable);
}
