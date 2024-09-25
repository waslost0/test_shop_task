import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/di/injection.dart';
import 'package:test_shop_task/features/user/domain/usecases/load_profile.dart';
import 'package:test_shop_task/features/user/presentation/provider/state/profile_notifier.dart';
import 'package:test_shop_task/features/user/presentation/provider/state/profile_state.dart';

final profileProvider =
    AutoDisposeStateNotifierProvider<ProfileProvider, ProfileState>(
  (ref) {
    return ProfileProvider(getIt<LoadProfileUseCase>())..loginProfile();
  },
);
