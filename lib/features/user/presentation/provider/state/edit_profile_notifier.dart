import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/logic/app_user.dart';
import 'package:test_shop_task/features/user/domain/entities/user_entity.dart';
import 'package:test_shop_task/features/user/domain/usecases/change_profile.dart';
import 'package:test_shop_task/features/user/presentation/provider/profile_provider.dart';

class EditProfileProvider extends ChangeNotifier {
  final ChangeNotifierProviderRef<EditProfileProvider> ref;
  final UserEntity user;
  final ChangeProfileUseCase _changeProfileUseCase;

  EditProfileProvider(
    this.ref,
    this._changeProfileUseCase,
  ) : user = ref.read(appUserProvider.notifier).user!;

  Future<bool> changeProfile(UserEntity user) async {
    final response = await _changeProfileUseCase.call(user);
    return await response.fold(
      (l) {
        BotToast.showText(text: l.message!);
        return false;
      },
      (r) {
        ref.read(appUserProvider.notifier).user = r;
        ref.read(profileProvider.notifier).notifyProfileChange();
        BotToast.showText(text: 'Профиль изменен');
        return true;
      },
    );
  }
}
