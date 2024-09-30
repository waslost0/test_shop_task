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
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productDescriptionMeta =
      const VerificationMeta('productDescription');
  @override
  late final GeneratedColumn<String> productDescription =
      GeneratedColumn<String>('product_description', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _imagesMeta = const VerificationMeta('images');
  @override
  late final GeneratedColumnWithTypeConverter<List<CustomFile>, String> images =
      GeneratedColumn<String>('images', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<CustomFile>>($ProductTableTable.$converterimages);
  @override
  List<GeneratedColumn> get $columns =>
      [productId, name, productDescription, imageUrl, price, images];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product';
  @override
  VerificationContext validateIntegrity(Insertable<ProductEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
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
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    context.handle(_imagesMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId};
  @override
  ProductEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductEntity(
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      productDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}product_description']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price']),
      images: $ProductTableTable.$converterimages.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}images'])!),
    );
  }

  @override
  $ProductTableTable createAlias(String alias) {
    return $ProductTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<CustomFile>, String> $converterimages =
      const JsonStringListConverter();
}

class ProductTableCompanion extends UpdateCompanion<ProductEntity> {
  final Value<int> productId;
  final Value<String> name;
  final Value<String?> productDescription;
  final Value<String?> imageUrl;
  final Value<double?> price;
  final Value<List<CustomFile>> images;
  const ProductTableCompanion({
    this.productId = const Value.absent(),
    this.name = const Value.absent(),
    this.productDescription = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.price = const Value.absent(),
    this.images = const Value.absent(),
  });
  ProductTableCompanion.insert({
    this.productId = const Value.absent(),
    required String name,
    this.productDescription = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.price = const Value.absent(),
    required List<CustomFile> images,
  })  : name = Value(name),
        images = Value(images);
  static Insertable<ProductEntity> custom({
    Expression<int>? productId,
    Expression<String>? name,
    Expression<String>? productDescription,
    Expression<String>? imageUrl,
    Expression<double>? price,
    Expression<String>? images,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (name != null) 'name': name,
      if (productDescription != null) 'product_description': productDescription,
      if (imageUrl != null) 'image_url': imageUrl,
      if (price != null) 'price': price,
      if (images != null) 'images': images,
    });
  }

  ProductTableCompanion copyWith(
      {Value<int>? productId,
      Value<String>? name,
      Value<String?>? productDescription,
      Value<String?>? imageUrl,
      Value<double?>? price,
      Value<List<CustomFile>>? images}) {
    return ProductTableCompanion(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      productDescription: productDescription ?? this.productDescription,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      images: images ?? this.images,
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
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (images.present) {
      map['images'] = Variable<String>(
          $ProductTableTable.$converterimages.toSql(images.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductTableCompanion(')
          ..write('productId: $productId, ')
          ..write('name: $name, ')
          ..write('productDescription: $productDescription, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('price: $price, ')
          ..write('images: $images')
          ..write(')'))
        .toString();
  }
}

class $CartItemTableTable extends CartItemTable
    with TableInfo<$CartItemTableTable, CartItemEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartItemTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
      'count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES product (product_id)'));
  @override
  List<GeneratedColumn> get $columns => [count, productId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart_item';
  @override
  VerificationContext validateIntegrity(Insertable<CartItemEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId};
  @override
  CartItemEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartItemEntity(
      count: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
    );
  }

  @override
  $CartItemTableTable createAlias(String alias) {
    return $CartItemTableTable(attachedDatabase, alias);
  }
}

class CartItemTableCompanion extends UpdateCompanion<CartItemEntity> {
  final Value<int> count;
  final Value<int> productId;
  const CartItemTableCompanion({
    this.count = const Value.absent(),
    this.productId = const Value.absent(),
  });
  CartItemTableCompanion.insert({
    required int count,
    this.productId = const Value.absent(),
  }) : count = Value(count);
  static Insertable<CartItemEntity> custom({
    Expression<int>? count,
    Expression<int>? productId,
  }) {
    return RawValuesInsertable({
      if (count != null) 'count': count,
      if (productId != null) 'product_id': productId,
    });
  }

  CartItemTableCompanion copyWith({Value<int>? count, Value<int>? productId}) {
    return CartItemTableCompanion(
      count: count ?? this.count,
      productId: productId ?? this.productId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartItemTableCompanion(')
          ..write('count: $count, ')
          ..write('productId: $productId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductTableTable productTable = $ProductTableTable(this);
  late final $CartItemTableTable cartItemTable = $CartItemTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [productTable, cartItemTable];
}

typedef $$ProductTableTableCreateCompanionBuilder = ProductTableCompanion
    Function({
  Value<int> productId,
  required String name,
  Value<String?> productDescription,
  Value<String?> imageUrl,
  Value<double?> price,
  required List<CustomFile> images,
});
typedef $$ProductTableTableUpdateCompanionBuilder = ProductTableCompanion
    Function({
  Value<int> productId,
  Value<String> name,
  Value<String?> productDescription,
  Value<String?> imageUrl,
  Value<double?> price,
  Value<List<CustomFile>> images,
});

final class $$ProductTableTableReferences
    extends BaseReferences<_$AppDatabase, $ProductTableTable, ProductEntity> {
  $$ProductTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CartItemTableTable, List<CartItemEntity>>
      _cartItemTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.cartItemTable,
              aliasName: $_aliasNameGenerator(
                  db.productTable.productId, db.cartItemTable.productId));

  $$CartItemTableTableProcessedTableManager get cartItemTableRefs {
    final manager = $$CartItemTableTableTableManager($_db, $_db.cartItemTable)
        .filter((f) => f.productId.productId($_item.productId));

    final cache = $_typedResult.readTableOrNull(_cartItemTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

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

  ColumnFilters<String> get imageUrl => $state.composableBuilder(
      column: $state.table.imageUrl,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<CustomFile>, List<CustomFile>, String>
      get images => $state.composableBuilder(
          column: $state.table.images,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ComposableFilter cartItemTableRefs(
      ComposableFilter Function($$CartItemTableTableFilterComposer f) f) {
    final $$CartItemTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $state.db.cartItemTable,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder, parentComposers) =>
            $$CartItemTableTableFilterComposer(ComposerState($state.db,
                $state.db.cartItemTable, joinBuilder, parentComposers)));
    return f(composer);
  }
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

  ColumnOrderings<String> get imageUrl => $state.composableBuilder(
      column: $state.table.imageUrl,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get images => $state.composableBuilder(
      column: $state.table.images,
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
    (ProductEntity, $$ProductTableTableReferences),
    ProductEntity,
    PrefetchHooks Function({bool cartItemTableRefs})> {
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
            Value<String?> imageUrl = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<List<CustomFile>> images = const Value.absent(),
          }) =>
              ProductTableCompanion(
            productId: productId,
            name: name,
            productDescription: productDescription,
            imageUrl: imageUrl,
            price: price,
            images: images,
          ),
          createCompanionCallback: ({
            Value<int> productId = const Value.absent(),
            required String name,
            Value<String?> productDescription = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<double?> price = const Value.absent(),
            required List<CustomFile> images,
          }) =>
              ProductTableCompanion.insert(
            productId: productId,
            name: name,
            productDescription: productDescription,
            imageUrl: imageUrl,
            price: price,
            images: images,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ProductTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({cartItemTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (cartItemTableRefs) db.cartItemTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cartItemTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ProductTableTableReferences
                            ._cartItemTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductTableTableReferences(db, table, p0)
                                .cartItemTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productId == item.productId),
                        typedResults: items)
                ];
              },
            );
          },
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
    (ProductEntity, $$ProductTableTableReferences),
    ProductEntity,
    PrefetchHooks Function({bool cartItemTableRefs})>;
typedef $$CartItemTableTableCreateCompanionBuilder = CartItemTableCompanion
    Function({
  required int count,
  Value<int> productId,
});
typedef $$CartItemTableTableUpdateCompanionBuilder = CartItemTableCompanion
    Function({
  Value<int> count,
  Value<int> productId,
});

final class $$CartItemTableTableReferences
    extends BaseReferences<_$AppDatabase, $CartItemTableTable, CartItemEntity> {
  $$CartItemTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ProductTableTable _productIdTable(_$AppDatabase db) =>
      db.productTable.createAlias($_aliasNameGenerator(
          db.cartItemTable.productId, db.productTable.productId));

  $$ProductTableTableProcessedTableManager? get productId {
    if ($_item.productId == null) return null;
    final manager = $$ProductTableTableTableManager($_db, $_db.productTable)
        .filter((f) => f.productId($_item.productId!));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$CartItemTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CartItemTableTable> {
  $$CartItemTableTableFilterComposer(super.$state);
  ColumnFilters<int> get count => $state.composableBuilder(
      column: $state.table.count,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ProductTableTableFilterComposer get productId {
    final $$ProductTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $state.db.productTable,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder, parentComposers) =>
            $$ProductTableTableFilterComposer(ComposerState($state.db,
                $state.db.productTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$CartItemTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CartItemTableTable> {
  $$CartItemTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get count => $state.composableBuilder(
      column: $state.table.count,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ProductTableTableOrderingComposer get productId {
    final $$ProductTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $state.db.productTable,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder, parentComposers) =>
            $$ProductTableTableOrderingComposer(ComposerState($state.db,
                $state.db.productTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$CartItemTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CartItemTableTable,
    CartItemEntity,
    $$CartItemTableTableFilterComposer,
    $$CartItemTableTableOrderingComposer,
    $$CartItemTableTableCreateCompanionBuilder,
    $$CartItemTableTableUpdateCompanionBuilder,
    (CartItemEntity, $$CartItemTableTableReferences),
    CartItemEntity,
    PrefetchHooks Function({bool productId})> {
  $$CartItemTableTableTableManager(_$AppDatabase db, $CartItemTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CartItemTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CartItemTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> count = const Value.absent(),
            Value<int> productId = const Value.absent(),
          }) =>
              CartItemTableCompanion(
            count: count,
            productId: productId,
          ),
          createCompanionCallback: ({
            required int count,
            Value<int> productId = const Value.absent(),
          }) =>
              CartItemTableCompanion.insert(
            count: count,
            productId: productId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CartItemTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (productId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productId,
                    referencedTable:
                        $$CartItemTableTableReferences._productIdTable(db),
                    referencedColumn: $$CartItemTableTableReferences
                        ._productIdTable(db)
                        .productId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$CartItemTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CartItemTableTable,
    CartItemEntity,
    $$CartItemTableTableFilterComposer,
    $$CartItemTableTableOrderingComposer,
    $$CartItemTableTableCreateCompanionBuilder,
    $$CartItemTableTableUpdateCompanionBuilder,
    (CartItemEntity, $$CartItemTableTableReferences),
    CartItemEntity,
    PrefetchHooks Function({bool productId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductTableTableTableManager get productTable =>
      $$ProductTableTableTableManager(_db, _db.productTable);
  $$CartItemTableTableTableManager get cartItemTable =>
      $$CartItemTableTableTableManager(_db, _db.cartItemTable);
}
