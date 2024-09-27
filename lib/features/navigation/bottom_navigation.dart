import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:test_shop_task/features/navigation/bottom_navigation_Item.dart';

class BottomNavigation extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  const BottomNavigation({
    super.key,
    required this.navigationShell,
    required this.children,
  });

  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends ConsumerState<BottomNavigation> {
  late final List<SalomonBottomBarItem> bottomNavigationItems =
      BottomNavigationItem.values.map((item) => item.item()).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: widget.children[widget.navigationShell.currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        margin: const EdgeInsets.all(16),
        currentIndex: widget.navigationShell.currentIndex,
        onTap: _goBranch,
        items: bottomNavigationItems,
      ),
    );
  }

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}
