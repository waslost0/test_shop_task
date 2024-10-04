import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/logic/app_user.dart';
import 'package:test_shop_task/core/usecases/usecase.dart';
import 'package:test_shop_task/features/user/domain/usecases/load_profile.dart';
import 'package:test_shop_task/features/user/presentation/provider/state/profile_state.dart';

class ProfileProvider extends StateNotifier<ProfileState> {
  final LoadProfileUseCase _loadProfileUseCase;
  final AutoDisposeStateNotifierProviderRef<ProfileProvider, ProfileState> ref;

  ProfileProvider(
    this._loadProfileUseCase,
    this.ref,
  ) : super(const Loading());

  Future<void> loadProfile() async {
    state = const ProfileState.loading();
    final response = await _loadProfileUseCase.call(
      NoParams(),
    );

    state = await response.fold(
      (failure) => Failure(failure),
      (result) {
        ref.read(appUserProvider).user = result;
        return Success(result);
      },
    );
  }

  Future<void> notifyProfileChange() async {
    state = (state as Success).copyWith(
      user: ref.read(appUserProvider).user!,
    );
  }
}
