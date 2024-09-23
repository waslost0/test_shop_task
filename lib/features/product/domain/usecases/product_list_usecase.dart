import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/params/list_params.dart';
import 'package:test_shop_task/core/usecases/usecase.dart';
import 'package:test_shop_task/features/product/domain/entities/product_entity.dart';
import 'package:test_shop_task/features/product/domain/repositories/product_repository.dart';

@injectable
class LoadProductUseCase implements UseCase<List<ProductEntity>, ListParams> {
  final ProductRepository _productRepository;

  LoadProductUseCase(this._productRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(ListParams params) async {
    return await _productRepository.getList(params.offset);
  }
}
