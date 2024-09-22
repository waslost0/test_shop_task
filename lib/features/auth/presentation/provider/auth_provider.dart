import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/di/injection.dart';
import 'package:test_shop_task/features/auth/domain/usecases/login_by_phone_code.dart';
import 'package:test_shop_task/features/auth/presentation/provider/state/auth_notifier.dart';
import 'package:test_shop_task/features/auth/presentation/provider/state/auth_state.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) {
    return AuthNotifier(getIt<LoginByPhoneCodeUseCase>());
  },
);
