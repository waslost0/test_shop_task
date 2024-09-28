import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/logic/app_user.dart';
import 'package:test_shop_task/core/logic/key_value_storage.dart';
import 'package:test_shop_task/core/logic/navigation_provider.dart';
import 'package:test_shop_task/di/injection.dart';

final appModelProvider = ChangeNotifierProvider<AppModel>(
  (ref) => AppModel(ref: ref),
);

class AppModel extends ChangeNotifier {
  late final AppUser appUser = ref.read(appUserProvider);

  final ChangeNotifierProviderRef ref;
  late LocalStorageService localStorageService = getIt<LocalStorageService>();

  bool isInitialized = false;

  AppModel({required this.ref});

  Future init() async {
    if (isAuthenticated) {
      await appUser.loadUserProfile();
    }
    isInitialized = true;
    notifyListeners();
    FlutterNativeSplash.remove();
  }

  bool get isAuthenticated => appUser.isAuthenticated();

  void logout() async {
    await appUser.logout();
    // TODO: temp solution
    var navigator = ref.read(navigatorProvider);
    navigator.materialAppKey = GlobalKey();
    navigator.key = GlobalKey();
    notifyListeners();
  }
}
