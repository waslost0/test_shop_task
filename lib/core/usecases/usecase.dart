import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_shop_task/core/errors/errors.dart';

abstract interface class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class CacheParams extends Equatable {
  final bool isCache;

  const CacheParams({
    required this.isCache,
  });

  @override
  List<Object?> get props => [isCache];
}
