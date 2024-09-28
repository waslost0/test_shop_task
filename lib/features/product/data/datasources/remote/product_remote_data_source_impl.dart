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
    String? searchString,
  }) async {
    final response = await _appHttpService.get(
      'shop/product/list',
      queryParameters: {
        'offset': offset,
        if (searchString?.isNotEmpty ?? false) 'text': searchString,
        if (categoryId != null) 'categoryId': categoryId,
      },
    );
    final products = response.data['products'] as List;
    return products.map((e) => Product.fromJson(e).toEntity()).toList();
  }

  @override
  Future<ProductEntity> product({required int productId}) async {
    final response = await _appHttpService.get(
      '/shop/product/details',
      queryParameters: {
        'productId': productId,
      },
    );
    return Product.fromJson(response.data['product']).toEntity();
  }
}
