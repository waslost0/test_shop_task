import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AppSlidable extends StatelessWidget {
  final Widget child;
  final double extentRatio;
  final List<Widget> Function() actionPaneBuilder;

  const AppSlidable({
    required this.child,
    this.extentRatio = 0.3,
    required this.actionPaneBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: extentRatio,
        motion: const ScrollMotion(),
        children: actionPaneBuilder.call(),
      ),
      child: GestureDetector(
        onLongPress: () => openSlidable(context),
        behavior: HitTestBehavior.translucent,
        child: child,
      ),
    );
  }

  void openSlidable(BuildContext context) {
    final slidable = Slidable.of(context);
    if (slidable != null) {
      slidable.openEndActionPane();
    }
  }
}
