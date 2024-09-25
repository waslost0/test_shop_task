import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/database/database.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/exceptions/exception_to_failure_converter.dart';
import 'package:test_shop_task/features/cart/domain/entities/cart_entity.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';

part 'package:test_shop_task/features/cart/data/repositories/cart_repository_impl.dart';

abstract class CartRepository {
  Future<Either<Failure, List<CartItemEntity>>> getList({
    int offset = 0,
  });

  Future<Either<Failure, bool>> addCartItem({
    required CartItemEntity cartItem,
  });
}
