import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_shop_task/core/theme/app_colors.dart';
import 'package:test_shop_task/core/theme/app_text_style.dart';
import 'package:test_shop_task/core/utils/platform_info.dart';

class BaseAlertDialog extends StatefulWidget {
  const BaseAlertDialog({
    this.title,
    super.key,
    this.text,
    this.positiveButtonTitle,
    this.onPositiveButtonPressed,
    this.negativeButtonTitle,
    this.onNegativeButtonPressed,
    this.isPositiveDefaultActionIOS = false,
    this.shouldShowLoadingIndicator = false,
    this.buttonTextStyle,
    this.spaceBetweenButtons = 8,
  });

  final String? title;
  final String? text;
  final String? negativeButtonTitle;
  final String? positiveButtonTitle;

  final Function()? onPositiveButtonPressed;
  final Function()? onNegativeButtonPressed;

  final bool shouldShowLoadingIndicator;
  final bool isPositiveDefaultActionIOS;

  final double spaceBetweenButtons;

  final TextStyle? buttonTextStyle;

  @override
  State<BaseAlertDialog> createState() => _BaseAlertDialogState();

  static Future<dynamic> showWithAnimation({
    required BuildContext context,
    required Widget Function(BuildContext) builder,
    bool barrierDismissible = true,
  }) async {
    return showGeneralDialog(
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: Curves.easeInOut.transform(a1.value),
          child: Opacity(
            opacity: a1.value,
            child: widget,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 250),
      barrierDismissible: barrierDismissible,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return builder.call(context);
      },
    );
  }

  static Future<dynamic> showDialog({
    required BuildContext context,
    String title = "Внимание",
    String? text,
    String positiveButtonTitle = "Да",
    String negativeButtonTitle = "Нет",
    Function(BuildContext context)? onNegativeButtonPressed,
    Function(BuildContext contex)? onPositiveButtonPressed,
    bool isPositiveDefaultActionIOS = false,
  }) async {
    return BaseAlertDialog.showWithAnimation(
      context: context,
      builder: (context) {
        return BaseAlertDialog(
          title: title,
          text: text,
          positiveButtonTitle: positiveButtonTitle,
          negativeButtonTitle: negativeButtonTitle,
          onPositiveButtonPressed: () => onPositiveButtonPressed?.call(context),
          onNegativeButtonPressed: () => onNegativeButtonPressed?.call(context),
          isPositiveDefaultActionIOS: isPositiveDefaultActionIOS,
        );
      },
    );
  }
}

class _BaseAlertDialogState extends State<BaseAlertDialog> {
  final TextStyle defaultButtonTextStyle = AppTextStyle.body3.copyWith(
    color: PlatformInfo.isIOS
        ? AppColors.iosAlertButtonTextColor
        : AppColors.primaryColor,
    fontWeight: FontWeight.w500,
  );

  EdgeInsets get actionsPadding => const EdgeInsets.only(
        left: 8,
        bottom: 8,
        right: 8,
      );

  EdgeInsets get contentPadding => const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 20,
      );

  EdgeInsets get titlePadding => EdgeInsets.only(
        top: 21,
        left: 24,
        right: 24,
        bottom: widget.text != null ? 16 : 40,
      );

  EdgeInsets get textButtonPadding => const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 20,
      );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      sized: false,
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: PlatformInfo.isIOS
          ? _buildCupertinoDialog(context)
          : _buildCustomMaterialDialog(context),
    );
  }

  Widget _buildCupertinoDialog(BuildContext context) {
    return CupertinoAlertDialog(
      title: widget.title != null
          ? Text(
              widget.title!,
              style: AppTextStyle.title,
            )
          : null,
      content: widget.text != null
          ? Text(
              widget.text!,
              style: AppTextStyle.small.copyWith(
                fontWeight: FontWeight.w500,
              ),
            )
          : null,
      actions: <Widget>[
        if (widget.onNegativeButtonPressed != null)
          _buildNegativeButton(context),
        _buildPositiveButton(context),
      ],
    );
  }

  Widget _buildCustomMaterialDialog(BuildContext context) {
    return Align(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            surfaceTintColor: Colors.transparent,
            title: widget.text != null ? buildTitle(context) : null,
            titlePadding: titlePadding,
            actions: [buildButtons(context)],
            actionsPadding: actionsPadding,
            content: buildText(context),
            contentPadding: contentPadding,
          ),
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    if (widget.title == null) {
      return const SizedBox.shrink();
    }
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        widget.title!,
        style: AppTextStyle.title,
      ),
    );
  }

  Widget buildText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.text == null ? 20 : 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          widget.text ?? widget.title ?? '',
          style: AppTextStyle.body3,
        ),
      ),
    );
  }

  Widget buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        if (widget.onNegativeButtonPressed != null)
          Padding(
            padding: EdgeInsets.only(right: widget.spaceBetweenButtons),
            child: _buildNegativeButton(context),
          ),
        _buildPositiveButton(context),
      ],
    );
  }

  Widget _buildPositiveButton(BuildContext context) {
    if (PlatformInfo.isIOS) {
      return CupertinoDialogAction(
        isDefaultAction: widget.isPositiveDefaultActionIOS,
        onPressed: widget.onPositiveButtonPressed,
        child: Text(
          widget.positiveButtonTitle ?? 'Да',
          style: widget.buttonTextStyle ?? defaultButtonTextStyle,
        ),
      );
    }
    return TextButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(textButtonPadding),
      ),
      onPressed: widget.onPositiveButtonPressed,
      child: Text(
        widget.positiveButtonTitle ?? 'Да',
        style: widget.buttonTextStyle ?? defaultButtonTextStyle,
      ),
    );
  }

  Widget _buildNegativeButton(BuildContext context) {
    if (PlatformInfo.isIOS) {
      return CupertinoDialogAction(
        onPressed: widget.onNegativeButtonPressed,
        child: Text(
          widget.negativeButtonTitle ?? 'Нет',
          style: widget.buttonTextStyle ?? defaultButtonTextStyle,
        ),
      );
    }
    return TextButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(textButtonPadding),
      ),
      onPressed: widget.onNegativeButtonPressed,
      child: Text(
        widget.negativeButtonTitle ?? 'Нет',
        style: widget.buttonTextStyle ?? defaultButtonTextStyle,
      ),
    );
  }
}
