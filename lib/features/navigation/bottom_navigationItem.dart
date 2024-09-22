import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:test_shop_task/features/catalog/presentation/screens/catalog_screen.dart';
import 'package:test_shop_task/features/user/presentation/screen/profile_page.dart';

enum BottomNavigationItem {
  main,
  profile;

  PersistentBottomNavBarItem item({
    required Function(int index)? onTap,
  }) {
    const activeColorPrimary = Colors.red;
    const inactiveColorPrimary = Colors.grey;
    switch (this) {
      case BottomNavigationItem.profile:
        return PersistentBottomNavBarItem(
          icon: const Icon(Icons.person_4_outlined),
          activeColorPrimary: activeColorPrimary,
          inactiveColorPrimary: inactiveColorPrimary,
          onPressed: (context) {
            onTap?.call(BottomNavigationItem.profile.value);
          },
        );
      default:
        return PersistentBottomNavBarItem(
          icon: const Icon(Icons.whatshot_outlined),
          activeColorPrimary: activeColorPrimary,
          inactiveColorPrimary: inactiveColorPrimary,
          onPressed: (context) {
            onTap?.call(BottomNavigationItem.main.value);
          },
        );
    }
  }

  Widget page() {
    switch (this) {
      case BottomNavigationItem.main:
        return const CatalogPage();
      default:
        return const ProfilePage();
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
