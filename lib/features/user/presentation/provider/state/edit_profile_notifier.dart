import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/logic/app_user.dart';
import 'package:test_shop_task/features/user/domain/entities/user_entity.dart';

class EditProfileProvider extends ChangeNotifier {
  final ChangeNotifierProviderRef<EditProfileProvider> ref;
  final UserEntity user;

  EditProfileProvider({
    required this.ref,
  }) : user = ref.read(appUserProvider.notifier).user!;

  Future<void> editProfile() async {}
}
