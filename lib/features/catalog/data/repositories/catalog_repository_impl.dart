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
  Future<Either<Failure, List<CategoryEntity>>> getList(int offset) async {
    try {
      final response = await _remoteDataSource.list(offset: offset);
      return Right(response);
    } catch (e, s) {
      return Left(
        ExceptionToFailureConverter.convert(e, s),
      );
    }
  }
}
