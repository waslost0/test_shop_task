part 'http_exception.dart';
part 'storage_exception.dart';

abstract class TlException implements Exception {
  final String? message;

  const TlException({this.message});
}
