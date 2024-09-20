import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_shop_task/core/logic/app_user.dart';
import 'package:test_shop_task/core/logic/key_value_storage.dart';

final appModelProvider = ChangeNotifierProvider<AppModel>(
  (ref) => AppModel(ref: ref),
);

class AppModel extends ChangeNotifier {
  late final AppUser appUser = ref.read(appUserProvider);

  final ChangeNotifierProviderRef ref;
  late SharedPreferences sharedPref;
  late LocalStorageService localStorageService;

  bool isInitialized = false;

  AppModel({required this.ref});

  Future init() async {
    sharedPref = await SharedPreferences.getInstance();
    localStorageService = ref.read(localStorageServiceProvider);
    isInitialized = true;
    notifyListeners();
  }
}
