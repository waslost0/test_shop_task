import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/usecases/usecase.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';
import 'package:test_shop_task/features/product/domain/repositories/product_repository.dart';
import 'package:test_shop_task/features/product/presentation/provider/state/product_state.dart';

@injectable
class LoadProductUseCase
    implements UseCase<List<ProductEntity>, ProductListParams> {
  final ProductRepository _productRepository;

  LoadProductUseCase(this._productRepository);

  @override
  Future<Either<AppFailure, List<ProductEntity>>> call(
    ProductListParams params,
  ) async {
    return await _productRepository.getList(
      offset: params.offset,
      categoryId: params.categoryId,
    );
  }
}
