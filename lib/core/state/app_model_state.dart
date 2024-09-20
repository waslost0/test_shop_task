import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_shop_task/core/model/config.dart';

part 'app_model_state.freezed.dart';

@freezed
class AppModelState with _$AppModelState {
  const factory AppModelState({
    @Default(true) bool isLoading,
    @Default(null) String? error,
    required Config config,
  }) = _AppModelState;
}
