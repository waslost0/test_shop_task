part of 'package:test_shop_task/features/catalog/domain/repositories/catalog_repository.dart';

@LazySingleton(
  as: CatalogRepository,
)
class CatalogRepositoryImpl extends CatalogRepository {
  final CatalogRemoteDataSource _remoteDataSource;

  CatalogRepositoryImpl(
    this._remoteDataSource,
  );

  @override
  Future<Either<Failure, List<CategoryEntity>>> getList({
    int offset = 0,
    int? parentId,
  }) async {
    try {
      final response = await _remoteDataSource.list(
        offset: offset,
        parentId: parentId,
      );
      return Right(response);
    } catch (e, s) {
      return Left(
        ExceptionToFailureConverter.convert(e, s),
      );
    }
  }
}
