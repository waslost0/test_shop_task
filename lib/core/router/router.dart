import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_shop_task/core/logic/app_model.dart';
import 'package:test_shop_task/core/router/routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider((ref) {
  final userState = ref.watch(appModelProvider);
  return GoRouter(
    initialLocation:
        userState.isAuthenticated ? AppRoutes.catalog : AppRoutes.auth,
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    observers: [BotToastNavigatorObserver()],
    redirect: (context, state) {
      if (!userState.isAuthenticated &&
          !(state.path?.contains(AppRoutes.phoneConfirm) ?? true)) {
        return AppRoutes.auth;
      }
      return state.path;
    },
    routes: $appRoutes,
  );
});

extension GoRouterX on GoRouter {
  String get currentPath => routerDelegate.currentConfiguration.fullPath;
}
