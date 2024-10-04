import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/logic/app_user.dart';
import 'package:test_shop_task/core/logic/key_value_storage.dart';
import 'package:test_shop_task/di/injection.dart';

/// Provider for the [AppModel] using [ChangeNotifierProvider].
final appModelProvider = ChangeNotifierProvider<AppModel>(
  (ref) => AppModel(ref: ref),
);

/// Model class responsible for managing the application's state and initialization.
///
/// This class extends [ChangeNotifier] to provide state updates to listeners.
/// It handles user authentication status, initialization of the application, and user logout.
/// It also interacts with [AppUser] and [LocalStorageService] for user data and persistence.
class AppModel extends ChangeNotifier {
  late final AppUser appUser = ref.read(appUserProvider);

  final ChangeNotifierProviderRef ref;

  late LocalStorageService localStorageService = getIt<LocalStorageService>();

  bool isInitialized = false;

  AppModel({required this.ref});

  /// Initializes the application.
  ///
  /// Loads user profile if the user is authenticated.
  /// Sets [isInitialized] to true and removes the native splash screen.
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
    notifyListeners();
  }
}
