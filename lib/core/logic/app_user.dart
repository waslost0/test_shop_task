import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_model.dart';

final appUserProvider = ChangeNotifierProvider<AppUser>(
  (ref) => AppUser(ref: ref),
);

class AppUser extends ChangeNotifier {
  static const String _accessTokenKey = "accessToken";
  late final AppModel appModel = ref.read(appModelProvider);

  final ChangeNotifierProviderRef ref;

  AppUser({required this.ref});

  bool isAuthenticated() {
    return false;
  }

  String? getAccessToken() {
    return appModel.localStorageService.getValue<String>(key: _accessTokenKey);
  }
}
