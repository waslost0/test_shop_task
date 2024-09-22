import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:test_shop_task/features/navigation/bottom_navigationItem.dart';

class BottomNavigation extends ConsumerStatefulWidget {
  const BottomNavigation({super.key});

  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends ConsumerState<BottomNavigation> {
  static const animationTime = Duration(milliseconds: 200);
  final PersistentTabController _controller = PersistentTabController();

  int previousIndex = 0;

  Completer? animation;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = BottomNavigationItem.values
        .map((item) => item.page())
        .toList();

    List<PersistentBottomNavBarItem> items = BottomNavigationItem.values
        .mapIndexed((index, item) => item.item(
              onTap: onTap,
            ))
        .toList();
    return PersistentTabView(
      context,
      controller: _controller,
      screens: screens,
      items: items,
      backgroundColor: Colors.white,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
          ? 0
          : kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.simple,
    );
  }

  void onTap(int index) {
    if (mounted && previousIndex != index && (animation?.isCompleted ?? true)) {
      animation = Completer();
      _controller.jumpToTab(index);
      Future.delayed(animationTime, () {
        animation?.complete(true);
        previousIndex = index;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
