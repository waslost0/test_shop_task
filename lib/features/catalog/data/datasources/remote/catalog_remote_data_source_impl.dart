part of "catalog_remote_data_source.dart";

@LazySingleton(
  as: CatalogRemoteDataSource,
)
class CatalogRemoteDataSourceImpl implements CatalogRemoteDataSource {
  final PrivateApi _appHttpService;

  CatalogRemoteDataSourceImpl(this._appHttpService);

  @override
  Future<List<CategoryEntity>> list({
    required int offset,
    int? parentId,
  }) async {
    final response = await _appHttpService.get(
      'category/list',
      queryParameters: {
        'offset': offset,
        if (parentId != null) 'parentId': parentId,
      },
    );
    final categories = response.data['categories'] as List;
    return categories.map((e) => Category.fromJson(e).toEntity()).toList();
  }
}
