part of 'exceptions.dart';

sealed class HttpException extends TlException {
  const HttpException({
    super.message,
  });
}

final class NoInternetException extends HttpException {
  const NoInternetException({
    super.message,
  });
}

final class BadRequestHttpException extends HttpException {
  const BadRequestHttpException({
    super.message,
  });
}

final class UnauthorizedHttpException extends HttpException {
  const UnauthorizedHttpException({
    super.message,
  });
}

final class NetworkConnectTimeoutException extends HttpException {
  const NetworkConnectTimeoutException({
    super.message,
  });
}

final class ServerErrorHttpException extends HttpException {
  const ServerErrorHttpException({
    super.message,
  });
}

final class MethodHttpException extends HttpException {
  const MethodHttpException({
    super.message,
  });
}

final class HttpMethodException extends HttpException {
  final int? statusCode;

  const HttpMethodException({
    super.message,
    this.statusCode,
  });
}
