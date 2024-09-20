import 'package:dartz/dartz.dart';
import 'package:test_shop_task/core/exceptions/app_exceptions.dart';
import 'package:test_shop_task/core/model/response.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<Either<AppException, Response>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<AppException, Response>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });
}
