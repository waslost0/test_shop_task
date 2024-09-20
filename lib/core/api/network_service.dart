import 'package:test_shop_task/core/model/api_response.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<ApiResponse> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<ApiResponse> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });
}
