import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigatorProvider = Provider<AppNavigator>(
    (_) => AppNavigator(key: GlobalKey<NavigatorState>()));

class AppNavigator {
  final GlobalKey<NavigatorState> key;

  AppNavigator({
    required this.key,
  });

  // MaterialPageRoute get homePage =>
  //     MaterialPageRoute(builder: (BuildContext context) => HomePage());
}
