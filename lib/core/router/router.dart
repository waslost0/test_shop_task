import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_shop_task/core/logic/app_model.dart';
import 'package:test_shop_task/core/router/routes.dart';

// This is super important - otherwise, we would throw away the whole widget tree when the provider is updated.
final navigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
// We need to have access to the previous location of the router. Otherwise, we would start from '/' on rebuild.
GoRouter? _previousRouter;

final routerProvider = Provider((ref) {
  final userState = ref.watch(appModelProvider);
  return _previousRouter = GoRouter(
    initialLocation: Routes.home,
    navigatorKey: navigatorKey,
    routes: [
      // ShellRoute(
      //   navigatorKey: _shellNavigatorKey,
      //   builder: (context, state, child) {
      //     return const BottomNavigation();
      //   },
      //   routes: [
      //     GoRoute(
      //       path: Routes.home,
      //       builder: (context, state) => const BottomNavigation(),
      //     ),
      //     GoRoute(
      //       path: Routes.profile,
      //       builder: (context, state) => const ProfilePage(),
      //     ),
      //     GoRoute(
      //       path: Routes.auth,
      //       builder: (context, state) => const AuthByPhonePage(),
      //     ),
      //   ],
      // ),
    ],
    // redirect: (context, state) {
    //   try {
    //     if (userState.isAuthenticated) {
    //       return  Routes.home;
    //     }
    //     return '/auth';
    //   } catch (e) {
    //     debugPrint("Error in redirect: $e");
    //   }
    //   return null;
    // },
  );
});
