import 'package:test_shop_task/core/errors/errors.dart';

class AppException extends Failure {
  const AppException({
    required super.message,
  });
}
