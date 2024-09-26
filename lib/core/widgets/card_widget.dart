import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_shop_task/core/theme/theme.dart';

class CardWidget extends StatelessWidget {
  final Widget? child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color? color;
  final List<BoxShadow>? boxShadow;

  const CardWidget({
    super.key,
    this.child,
    this.boxShadow,
    this.margin = const EdgeInsets.symmetric(
      vertical: ThemeBuilder.defaultSmallPadding,
      horizontal: ThemeBuilder.defaultPadding,
    ),
    this.padding = EdgeInsets.zero,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    var cardDecoration = ThemeBuilder.buildCardDecoration.copyWith(
      boxShadow: boxShadow,
      color: color,
    );
    return Container(
      decoration: cardDecoration,
      margin: margin,
      padding: padding,
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
