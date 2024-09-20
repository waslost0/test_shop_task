import 'package:dartz/dartz.dart';
import 'package:test_shop_task/core/exceptions/app_exceptions.dart';

class Response {
  final int statusCode;
  final String? statusMessage;
  final Map<String, dynamic>? data;

  Response({
    required this.statusCode,
    this.statusMessage,
    this.data,
  });

  @override
  String toString() {
    return 'Response{statusCode: $statusCode, statusMessage: $statusMessage, data: $data}';
  }

  Right<AppException, Response> get toRight => Right(this);
}
