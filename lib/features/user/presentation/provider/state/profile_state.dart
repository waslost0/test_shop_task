import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_shop_task/core/errors/errors.dart';
import 'package:test_shop_task/features/user/domain/entities/user_entity.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = Initial;

  const factory ProfileState.loading() = Loading;

  const factory ProfileState.failure(AppFailure exception) = Failure;

  const factory ProfileState.success(UserEntity user) = Success;
}
