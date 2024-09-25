import 'package:equatable/equatable.dart';

class AppFailure extends Equatable {
  final String? message;

  const AppFailure({
    this.message,
  });

  @override
  List<Object?> get props => [message];
}

class HttpMethodFailure extends AppFailure {
  final int? code;

  const HttpMethodFailure({
    this.code,
    super.message,
  });

  @override
  List<Object?> get props => [...super.props, code];
}

class BadRequestServerFailure extends AppFailure {
  const BadRequestServerFailure({
    super.message,
  });
}

class UnauthorizedServerFailure extends AppFailure {
  const UnauthorizedServerFailure({
    super.message,
  });
}

class ServerFailure extends AppFailure {
  const ServerFailure({
    super.message,
  });
}

class NoInternetFailure extends AppFailure {
  const NoInternetFailure({
    super.message,
  });
}

class NotFoundFailure extends AppFailure {
  const NotFoundFailure({
    super.message,
  });
}

class ServerTimeoutFailure extends AppFailure {
  const ServerTimeoutFailure({
    super.message,
  });
}

class ServerCertificateFailure extends AppFailure {
  const ServerCertificateFailure({
    super.message,
  });
}

class ServerCancelFailure extends AppFailure {
  const ServerCancelFailure({
    super.message,
  });
}

class ServerConnectionFailure extends AppFailure {
  const ServerConnectionFailure({
    super.message,
  });
}

class UnknownServerFailure extends AppFailure {
  const UnknownServerFailure({
    super.message,
  });
}

class EmptyDataFailure extends AppFailure {
  const EmptyDataFailure({
    super.message,
  });
}
