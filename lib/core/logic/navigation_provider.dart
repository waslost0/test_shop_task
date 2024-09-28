import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigatorProvider = Provider<AppNavigator>(
  (_) => AppNavigator(
    materialAppKey: GlobalKey(),
  ),
);

class AppNavigator {
  GlobalKey materialAppKey;

  AppNavigator({
    required this.materialAppKey,
  });
}
