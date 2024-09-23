import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/features/auth/domain/entities/auth_params.dart';
import 'package:test_shop_task/features/auth/domain/usecases/login_by_phone_code.dart';
import 'package:test_shop_task/features/auth/domain/usecases/send_sms_code.dart';
import 'package:test_shop_task/features/auth/presentation/provider/state/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginByPhoneCodeUseCase _loginUseCase;
  final SendSmsCodeUseCase _sendSmsCodeUseCase;

  AuthNotifier(
    this._loginUseCase,
    this._sendSmsCodeUseCase,
  ) : super(const AuthState.initial());

  Future<void> loginUser(String phone, String code) async {
    state = const AuthState.loading();
    final response = await _loginUseCase.call(
      AuthParams(phone: phone, code: code),
    );

    state = await response.fold(
      (failure) => AuthState.failure(failure),
      (result) => const AuthState.success(),
    );
  }

  Future<void> sendSmsCode(String phone) async {
    state = const AuthState.loading();
    final response = await _sendSmsCodeUseCase.call(
      SendSmsCodeParams(phone: phone),
    );

    state = await response.fold(
      (failure) => AuthState.failure(failure),
      (result) => const AuthState.success(),
    );
  }
}
