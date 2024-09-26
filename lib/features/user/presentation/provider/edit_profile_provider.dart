import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/features/user/presentation/provider/state/edit_profile_notifier.dart';

final editProfileProvider = ChangeNotifierProvider<EditProfileProvider>(
  (ref) {
    return EditProfileProvider(ref: ref);
  },
);
