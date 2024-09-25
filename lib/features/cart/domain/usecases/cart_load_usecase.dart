import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/core/usecases/usecase.dart';
import 'package:test_shop_task/features/cart/domain/entities/cart_entity.dart';
import 'package:test_shop_task/features/cart/domain/repositories/cart_repository.dart';

@injectable
class CartLoadUseCase implements UseCase<List<CartItemEntity>, NoParams> {
  final CartRepository _cartRepository;

  CartLoadUseCase(this._cartRepository);

  @override
  Future<Either<AppFailure, List<CartItemEntity>>> call(NoParams params) async {
    return await _cartRepository.getList();
  }
}
