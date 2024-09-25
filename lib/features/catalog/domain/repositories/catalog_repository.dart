import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/exceptions/exception_to_failure_converter.dart';
import 'package:test_shop_task/features/catalog/data/datasources/remote/catalog_remote_data_source.dart';
import 'package:test_shop_task/features/catalog/domain/entities/category_entity.dart';

part 'package:test_shop_task/features/catalog/data/repositories/catalog_repository_impl.dart';

abstract class CatalogRepository {
  Future<Either<AppFailure, List<CategoryEntity>>> getList({
    int offset = 0,
    int? parentId,
  });
}
