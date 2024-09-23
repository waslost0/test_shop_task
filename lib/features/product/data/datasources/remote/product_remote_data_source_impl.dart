part of "product_remote_data_source.dart";

@LazySingleton(
  as: ProductRemoteDataSource,
)
class CatalogRemoteDataSourceImpl implements ProductRemoteDataSource {
  final PrivateApi _appHttpService;

  CatalogRemoteDataSourceImpl(this._appHttpService);

  @override
  Future<List<ProductEntity>> list({required int offset}) async {
    final response = await _appHttpService.get(
      'category/list',
    );
    final products = response.data['products'] as List;
    return products.map((e) => Product.fromJson(e).toEntity()).toList();
  }
}
