import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/di/injection.dart';
import 'package:test_shop_task/features/user/domain/usecases/change_profile.dart';
import 'package:test_shop_task/features/user/presentation/provider/state/edit_profile_notifier.dart';

final editProfileProvider =
    AutoDisposeChangeNotifierProvider<EditProfileProvider>(
  (ref) {
    return EditProfileProvider(
      ref,
      getIt<ChangeProfileUseCase>(),
    );
  },
);
