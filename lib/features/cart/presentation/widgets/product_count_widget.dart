import 'package:flutter/material.dart';
import 'package:test_shop_task/core/theme/app_colors.dart';

class ProductCounterWidget extends StatelessWidget {
  final TextStyle? textStyle;
  final int count;
  final double width;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ProductCounterWidget({
    super.key,
    this.textStyle,
    required this.onIncrement,
    required this.onDecrement,
    required this.count,
    this.width = 110,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: width),
      decoration: BoxDecoration(
        color: AppColors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: <Widget>[
          _buildButton(
            context: context,
            icon: Icons.remove,
            onPressed: onDecrement,
          ),
          Expanded(
            child: Center(
              child: _buildCountWidget(context, count),
            ),
          ),
          _buildButton(
            context: context,
            icon: Icons.add,
            onPressed: onIncrement,
          ),
        ],
      ),
    );
  }

  Widget _buildCountWidget(BuildContext context, int productCount) {
    return Text(
      "$productCount",
      style: textStyle ??
          const TextStyle(
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required IconData icon,
    ButtonStyle? style,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 32,
      height: 32,
      child: ElevatedButton(
        style: style ?? activeStyle,
        onPressed: onPressed,
        child: Icon(
          icon,
          color: AppColors.white,
        ),
      ),
    );
  }

  ButtonStyle get activeStyle => const ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
        minimumSize: WidgetStatePropertyAll(Size(32, 32)),
        backgroundColor: WidgetStatePropertyAll(AppColors.amaranthRed),
      );
}
