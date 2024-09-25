import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/usecases/usecase.dart';
import 'package:test_shop_task/features/user/domain/usecases/load_profile.dart';
import 'package:test_shop_task/features/user/presentation/provider/state/profile_state.dart';

class ProfileProvider extends StateNotifier<ProfileState> {
  final LoadProfileUseCase _loadProfileUseCase;

  ProfileProvider(
    this._loadProfileUseCase,
  ) : super(const Loading());

  Future<void> loginProfile() async {
    state = const ProfileState.loading();
    final response = await _loadProfileUseCase.call(
      NoParams(),
    );

    state = await response.fold(
      (failure) => Failure(failure),
      (result) => Success(result),
    );
  }
}
