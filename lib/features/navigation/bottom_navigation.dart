import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:test_shop_task/features/navigation/bottom_navigation_Item.dart';

class BottomNavigation extends ConsumerStatefulWidget {
  const BottomNavigation({super.key});

  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends ConsumerState<BottomNavigation> {
  static const animationTime = Duration(milliseconds: 200);

  late final List<SalomonBottomBarItem> bottomNavigationItems =
      BottomNavigationItem.values.map((item) => item.item()).toList();

  late final List<Widget> screens =
      BottomNavigationItem.values.map((item) => item.page()).toList();

  final PageController _controller = PageController();

  int _currentIndex = 0;

  Completer? animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        itemBuilder: (context, index) => screens[index],
      ),
      bottomNavigationBar: SalomonBottomBar(
        margin: const EdgeInsets.all(16),
        currentIndex: _currentIndex,
        onTap: onTap,
        items: bottomNavigationItems,
      ),
    );
  }

  void onTap(int index) {
    if (mounted && _currentIndex != index && (animation?.isCompleted ?? true)) {
      animation = Completer();
      _controller.jumpToPage(index);
      Future.delayed(animationTime, () {
        animation?.complete(true);
        _currentIndex = index;
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
