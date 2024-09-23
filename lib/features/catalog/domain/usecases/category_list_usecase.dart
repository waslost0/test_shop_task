import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/usecases/usecase.dart';
import 'package:test_shop_task/features/catalog/domain/entities/category_entity.dart';
import 'package:test_shop_task/features/catalog/domain/repositories/catalog_repository.dart';
import 'package:test_shop_task/features/catalog/presentation/provider/state/catalog_state.dart';

@injectable
class CatalogRepositoryUseCase
    implements UseCase<List<CategoryEntity>, CategoryListParams> {
  final CatalogRepository _catalogRepository;

  CatalogRepositoryUseCase(this._catalogRepository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(CategoryListParams params) async {
    return await _catalogRepository.getList(
      offset: params.offset,
      parentId: params.parentId,
    );
  }
}
