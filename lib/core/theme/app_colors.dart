import 'package:flutter/material.dart';

class AppColors {
  /// Базовые цвета
  static const Color black = Color(0xFF1C1C1C);
  static const Color black2 = Color(0xFF2A2A2A);
  static const Color black3 = Color(0xFF353535);
  static const Color hint = Color(0xB58C95E6);

  static const Color lightBlack = Color(0xFF191919);
  static const Color fullBlack = Color(0xFF000000);
  static const Color charcoal = Color(0xFF313131);
  static const Color raisinBlack = Color(0xFF242424);
  static const Color white = Color(0xFFFFFFFF);
  static const Color white2 = Color(0xFFDBDBDB);
  static const Color ligthGray = Color(0xFFD6D6D9);
  static const Color lotion = Color(0xFFFAFCFC);
  static const Color green = Color(0xFF2AA95D);
  static const Color medGreen = Color(0xFF1dbf54);
  static const Color lightGreen = Color(0xFF50df4d);

  static const Color barrierColor = Colors.black54;

  static const Color salem = Color(0xFF198645);
  static const Color red = Color(0xFFE23646);
  static const Color amaranthRed = Color(0xFFD51F30);
  static const Color rubyRed = Color(0xFFA11522);
  static const Color lightRed = Color(0xFFEEE1CD);
  static const Color yellow = Color(0xFFFFDD61);
  static const Color lightGrey = Color.fromRGBO(238, 238, 238, 1);
  static const Color highLightGrey = Color.fromRGBO(255, 255, 255, 0.1);
  static const Color greyText = silver;
  static const Color grey = Color(0xFF646464);
  static const Color midGrey = Color(0xFF9B9B9B);
  static const Color darkGrey = Color(0xFF867274);
  static const Color silver = Color(0xFFC4C4C4);
  static const Color gainsboro = Color(0xFFDADADA);
  static const Color blue = Color(0xFF18ABCB);
  static const Color lightBlue = Color(0xFF3CB5CF);
  static const Color lightViolet = Color(0xFF7A879C);
  static const Color glaucous = Color(0xFF7B8595);

  static const Color background = Color(0xFFFEFFFF);
  static const Color dialogBackgroundColor = Color(0xFFFAFBFB);
  static const Color textFieldError = Color(0xFFFBE8E8);
  static const Color textFieldGray = Color(0xFFF5F6F7);
  static const Color lightGray = Color(0xFFC4C9D2);
  static const Color midGray = Color(0xFFA2AABB);
  static const Color focusedBorder = Color(0xFF7A8699);
  static const Color errorBorder = Color(0xFFD9141B);
  static const Color buttonShadow = Color(0xFFF4F4F7);

  /// Основной цвет, который чаще всего отображается на экранах и компонентах
  /// приложения.
  static const Color primaryColor = black;

  /// Цвет, который используется для контраста основного цвета (например в
  /// Notification(System) bar'е).
  static const Color primaryVariantColor = Color(0xFF2167F3);

  /// Вторичный цвет для FAB'ов, селекторов, слайдеров, переключателей,
  /// подсветки выделенного текста, прогрессбаров, ссылок и заголовков.
  static const Color secondaryColor = black;

  /// Цвет, который используется для контраста вторичного цвета (например
  /// текст внутри кнопки)
  static const Color secondaryVariantColor = white;

  /// Цвет фона отображается за скролящимся содержимым.
  static const Color backgroundColor = lightBlack;

  /// Цвет поверхности используется на карточках, bottomSheet и меню.
  static const Color surfaceColor = Color(0x0AFFFFFF);

  /// Цвет ошибки указывает на ошибки в компонентах, например недопустимый
  /// текст в текстовом поле.
  static const Color errorColor = rubyRed;

  /// Цвет [Scaffold] background.
  static const Color scaffoldBackgroundColor = lightBlack;

  /// The background color of [Dialog] elements.
  static const Color dialogBackground = lightBlack;

  /// Background theme color for the [AppBar].
  static const Color appBarBackground = primaryColor;

  /// Background theme color for the [ProgressIndicator],
  /// [CircularProgressIndicator], [RefreshIndicator], [CupertinoActivityIndicator].
  static const Color updatingIndicatorColor = white;

  /// Цвета «on*» в основном применяются к тексту, значкам и штрихам.
  /// Иногда их наносят на поверхности.
  /// Такие цвета используются для того, чтобы элементы, использующие их, были
  /// четкими и разборчивыми по сравнению с цветами за ними.
  static const Color onPrimaryColor = white;
  static const Color onSecondaryColor = white;
  static const Color onBackgroundColor = white;
  static const Color onSurfaceColor = white;
  static const Color onErrorColor = white;

  /// Цвета для элементов
  static const Color defaultText = black2;
  static const Color divider = Color(0xFFCED2DC);
  static const Color border = charcoal;
  static const Color disabledBorder = Color(0xFFB9BECB);
  static const Color defaultShadow = Color(0x5E020202);
  static const Color iosAlertButtonTextColor = white;
  static const Color alertDialogColor = black3;
}
