import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_shop_task/core/errors/errors.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;

  const factory AuthState.loading() = Loading;

  const factory AuthState.failure(AppFailure exception) = AuthFailure;

  const factory AuthState.success() = Success;
}
