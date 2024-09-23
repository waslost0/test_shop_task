import 'package:equatable/equatable.dart';

class AuthParams extends Equatable {
  final String phone;
  final String code;

  const AuthParams({
    required this.phone,
    required this.code,
  });

  @override
  List<Object?> get props => [
        phone,
        code,
      ];
}

class SendSmsCodeParams extends Equatable {
  final String phone;

  const SendSmsCodeParams({
    required this.phone,
  });

  @override
  List<Object?> get props => [
        phone,
      ];
}
