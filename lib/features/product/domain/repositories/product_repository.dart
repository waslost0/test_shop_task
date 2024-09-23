import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/exceptions/exception_to_failure_converter.dart';
import 'package:test_shop_task/features/product/data/datasources/remote/product_remote_data_source.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';

part 'package:test_shop_task/features/product/data/repositories/product_repository_impl.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getList(int offset);
}
