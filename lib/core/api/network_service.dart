import 'package:dio/dio.dart';
import 'package:test_shop_task/core/model/api_response.dart';

/// Abstract class defining the interface for network services.
///
/// This class provides a blueprint for making network requests, including GET, POST, and POST with file uploads.
/// It defines methods for setting the base URL, headers, and updating headers. Concrete implementations of this
abstract class NetworkService {
  /// Returns the base URL for network requests.
  String get baseUrl;

  /// Returns the headers to be included in network requests.
  Map<String, Object> get headers;

  /// Performs a GET request to the specified endpoint.
  ///
  /// [endpoint] The endpoint for the GET request.
  /// [queryParameters] Optional query parameters to be included in the request.
  ///
  /// Returns a `Future<ApiResponse>` containing the response data.
  Future<ApiResponse> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  /// Performs a POST request to the specified endpoint.
  ///
  /// [endpoint] The endpoint for the POST request.
  /// [data] Optional data to be sent in the request body.
  ///
  /// Returns a `Future<ApiResponse>` containing the response data.
  Future<ApiResponse> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });

  /// Performs a POST request with file upload to the specified endpoint.
  ///
  /// [endpoint] The endpoint for the POST request.
  /// [data] Optional FormData containing the file and other data to be sent in the request body.
  ///
  /// Returns a `Future<ApiResponse>` containing the response data.
  Future<ApiResponse> postWithFile(
    String endpoint, {
    FormData? data,
  });
}
