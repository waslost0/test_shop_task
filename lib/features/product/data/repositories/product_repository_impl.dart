part of 'package:test_shop_task/features/product/domain/repositories/product_repository.dart';

@LazySingleton(
  as: ProductRepository,
)
class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource _remoteDataSource;

  ProductRepositoryImpl(
    this._remoteDataSource,
  );

  @override
  Future<Either<Failure, List<ProductEntity>>> getList({
    int offset = 0,
    int? categoryId,
  }) async {
    try {
      final response = await _remoteDataSource.list(
        offset: offset,
        categoryId: categoryId,
      );
      return Right(response);
    } catch (e, s) {
      return Left(
        ExceptionToFailureConverter.convert(e, s),
      );
    }
  }
}
