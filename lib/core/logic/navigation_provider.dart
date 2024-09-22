import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigatorProvider = Provider<AppNavigator>(
  (_) => AppNavigator(
    key: GlobalKey<NavigatorState>(),
    materialAppKey: GlobalKey(),
  ),
);

class AppNavigator {
  GlobalKey<NavigatorState> key;
  GlobalKey materialAppKey;

  AppNavigator({
    required this.key,
    required this.materialAppKey,
  });
}
