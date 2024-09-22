import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:test_shop_task/features/auth/presentation/screen/auth_by_phone.dart';
import 'package:test_shop_task/features/user/presentation/screen/profile_page.dart';

enum BottomNavigationItem {
  main,
  profile;

  PersistentBottomNavBarItem item({
    required bool isAuthorized,
    required Function(int index)? onTap,
  }) {
    const activeColorPrimary = Colors.red;
    const inactiveColorPrimary = Colors.grey;
    switch (this) {
      case BottomNavigationItem.profile:
        if (isAuthorized) {
          return PersistentBottomNavBarItem(
            icon: const Icon(Icons.person_2_outlined),
            activeColorPrimary: activeColorPrimary,
            inactiveColorPrimary: inactiveColorPrimary,
            routeAndNavigatorSettings: const RouteAndNavigatorSettings(
              initialRoute: "/",
            ),
            onPressed: (context) {
              onTap?.call(BottomNavigationItem.profile.value);
            },
          );
        }
        return PersistentBottomNavBarItem(
          icon: const Icon(Icons.person_4_outlined),
          activeColorPrimary: activeColorPrimary,
          inactiveColorPrimary: inactiveColorPrimary,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              // "/registration": (context) => RegistrationPage(),
            },
          ),
          onPressed: (context) {
            onTap?.call(BottomNavigationItem.profile.value);
          },
        );
      default:
        return PersistentBottomNavBarItem(
          icon: const Icon(Icons.whatshot_outlined),
          activeColorPrimary: activeColorPrimary,
          inactiveColorPrimary: inactiveColorPrimary,
          routeAndNavigatorSettings: const RouteAndNavigatorSettings(
            initialRoute: "/",
          ),
          onPressed: (context) {
            onTap?.call(BottomNavigationItem.main.value);
          },
        );
    }
  }

  Widget page({
    required bool isAuthorized,
  }) {
    switch (this) {
      case BottomNavigationItem.main:
        return Placeholder();
      default:
        return isAuthorized ? ProfilePage() : AuthByPhonePage();
    }
  }

  int get value {
    switch (this) {
      case BottomNavigationItem.main:
        return 0;
      case BottomNavigationItem.profile:
        return 1;
      default:
        return -1;
    }
  }
}
