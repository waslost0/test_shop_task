import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/exceptions/app_exceptions.dart';
import 'package:test_shop_task/features/auth/domain/entities/auth_params.dart';
import 'package:test_shop_task/features/auth/domain/usecases/login_by_phone_code.dart';
import 'package:test_shop_task/features/auth/presentation/provider/state/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginByPhoneCodeUseCase _loginUseCase;

  AuthNotifier(
    this._loginUseCase,
  ) : super(const AuthState.initial());

  Future<void> loginUser(String phone, String code) async {
    state = const AuthState.loading();
    final response = await _loginUseCase.call(
      AuthParams(phone: phone, code: code),
    );

    state = await response.fold(
      (failure) => AuthState.failure(failure),
      (user) async {
        // TODO SET TOKEN NAVIGATE TO HOME PAGE
        // final hasSavedUser = await userRepository.saveUser(user: user);
        // if (hasSavedUser) {
        //   return const AuthState.success();
        // }
        return AuthState.failure(AppException(message: 'fuck'));
      },
    );
  }
}
