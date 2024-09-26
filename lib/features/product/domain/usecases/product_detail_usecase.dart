import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/usecases/usecase.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';
import 'package:test_shop_task/features/product/domain/repositories/product_repository.dart';

@injectable
class LoadProductDetailUseCase implements UseCase<ProductEntity, int> {
  final ProductRepository _productRepository;

  LoadProductDetailUseCase(this._productRepository);

  @override
  Future<Either<AppFailure, ProductEntity>> call(
    int productId,
  ) async {
    return await _productRepository.getProduct(productId: productId);
  }
}
