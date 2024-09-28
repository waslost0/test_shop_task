import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigatorProvider = Provider<AppNavigator>(
  (_) => AppNavigator(
    materialAppKey: GlobalKey(),
    navigatorKey: GlobalKey<NavigatorState>(),
  ),
);

class AppNavigator {
  final GlobalKey materialAppKey;
  final GlobalKey<NavigatorState> navigatorKey;

  AppNavigator({
    required this.materialAppKey,
    required this.navigatorKey,
  });
}
