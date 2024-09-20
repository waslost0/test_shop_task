import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String? message;

  const Failure({
    this.message,
  });

  @override
  List<Object?> get props => [message];
}

class HttpMethodFailure extends Failure {
  final int? code;

  const HttpMethodFailure({
    this.code,
    super.message,
  });

  @override
  List<Object?> get props => [...super.props, code];
}

class BadRequestServerFailure extends Failure {
  const BadRequestServerFailure({
    super.message,
  });
}

class UnauthorizedServerFailure extends Failure {
  const UnauthorizedServerFailure({
    super.message,
  });
}

class ServerFailure extends Failure {
  const ServerFailure({
    super.message,
  });
}

class NoInternetFailure extends Failure {
  const NoInternetFailure({
    super.message,
  });
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({
    super.message,
  });
}

class ServerTimeoutFailure extends Failure {
  const ServerTimeoutFailure({
    super.message,
  });
}

class ServerCertificateFailure extends Failure {
  const ServerCertificateFailure({
    super.message,
  });
}

class ServerCancelFailure extends Failure {
  const ServerCancelFailure({
    super.message,
  });
}

class ServerConnectionFailure extends Failure {
  const ServerConnectionFailure({
    super.message,
  });
}

class UnknownServerFailure extends Failure {
  const UnknownServerFailure({
    super.message,
  });
}

class EmptyDataFailure extends Failure {
  const EmptyDataFailure({
    super.message,
  });
}
