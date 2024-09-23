import 'package:flutter/material.dart';
import 'package:test_shop_task/core/theme/app_colors.dart';

class AppTextStyle {

  static const TextStyle title = TextStyle(
    fontSize: 20,
    color: AppColors.defaultText,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle title2 = TextStyle(
    fontSize: 18,
    color: AppColors.defaultText,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    color: AppColors.defaultText,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle small = TextStyle(
    fontSize: 12,
    color: AppColors.defaultText,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle hyperLink = TextStyle(
    fontSize: 12,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.primaryColor,
    shadows: [
      Shadow(
        color: AppColors.primaryColor,
        offset: Offset(0, -1),
      ),
    ],
    color: Colors.transparent,
  );
}
