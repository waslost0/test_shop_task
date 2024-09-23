part of "product_remote_data_source.dart";

@LazySingleton(
  as: ProductRemoteDataSource,
)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final PrivateApi _appHttpService;

  ProductRemoteDataSourceImpl(this._appHttpService);

  @override
  Future<List<ProductEntity>> list({
    required int offset,
    int? categoryId,
  }) async {
    final response = await _appHttpService.get(
      'shop/product/list',
      queryParameters: {
        'offset': offset,
        if (categoryId != null) 'categoryId': categoryId,
      },
    );
    final products = response.data['products'] as List;
    return products.map((e) => Product.fromJson(e).toEntity()).toList();
  }
}
