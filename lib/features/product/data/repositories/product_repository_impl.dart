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
  Future<Either<AppFailure, List<ProductEntity>>> getList({
    int offset = 0,
    int? categoryId,
    String? searchString,
  }) async {
    try {
      final response = await _remoteDataSource.list(
        offset: offset,
        searchString: searchString,
        categoryId: categoryId,
      );
      return Right(response);
    } catch (e, s) {
      return Left(
        ExceptionToFailureConverter.convert(e, s),
      );
    }
  }

  @override
  Future<Either<AppFailure, ProductEntity>> getProduct({
    required int productId,
  }) async {
    try {
      final response = await _remoteDataSource.product(
        productId: productId,
      );
      return Right(response);
    } catch (e, s) {
      return Left(
        ExceptionToFailureConverter.convert(e, s),
      );
    }
  }
}
