import 'package:test_shop_task/core/errors/errors.dart';

class AppException extends AppFailure {
  final StackTrace? stack;

  const AppException({
    required super.message,
    this.stack,
  });
}
