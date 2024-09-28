import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:test_shop_task/core/theme/app_colors.dart';
import 'package:test_shop_task/features/cart/presentation/screens/cart_screen.dart';
import 'package:test_shop_task/features/catalog/presentation/screens/catalog_screen.dart';
import 'package:test_shop_task/features/user/presentation/screen/profile_page.dart';

enum BottomNavigationItem {
  main,
  cart,
  profile;

  SalomonBottomBarItem item() {
    const activeColorPrimary = AppColors.red;
    const unselectedColor = AppColors.black;
    switch (this) {
      case BottomNavigationItem.main:
        return SalomonBottomBarItem(
          icon: const Icon(Icons.home),
          title: const Text("Home"),
          unselectedColor: unselectedColor,
          selectedColor: activeColorPrimary,
        );
      case BottomNavigationItem.profile:
        return SalomonBottomBarItem(
          icon: const Icon(Icons.person),
          title: const Text("Profile"),
          unselectedColor: unselectedColor,
          selectedColor: activeColorPrimary,
        );
      case BottomNavigationItem.cart:
        return SalomonBottomBarItem(
          icon: const Icon(Icons.shopping_cart_rounded),
          title: const Text("Cart"),
          unselectedColor: unselectedColor,
          selectedColor: activeColorPrimary,
        );
    }
  }

  Widget page() {
    switch (this) {
      case BottomNavigationItem.main:
        return const CatalogListPage();
      case BottomNavigationItem.cart:
        return const CartListPage();
      case BottomNavigationItem.profile:
        return const ProfilePage();
      default:
        return const ProfilePage();
    }
  }

  int get value {
    switch (this) {
      case BottomNavigationItem.main:
        return 0;
      case BottomNavigationItem.cart:
        return 1;
      case BottomNavigationItem.profile:
        return 2;
      default:
        return -1;
    }
  }
}
