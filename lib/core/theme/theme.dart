import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_shop_task/core/theme/app_colors.dart';

const iconButtonDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: AppColors.buttonShadow,
      offset: Offset(0, 6),
      blurRadius: 16.0,
    ),
  ],
  shape: BoxShape.circle,
);

final elevatedButtonGrayStyle = ElevatedButton.styleFrom(
  backgroundColor: AppColors.textFieldGray,
  foregroundColor: AppColors.black,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12.0),
  ),
  minimumSize: const Size.fromHeight(52),
  textStyle: const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
  ),
  elevation: 0,
);

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

/// Класс для формирования "визуальной темы" приложения
/// - внешний вид текстов
/// - внешний вид кнопок
/// - внешний вид полей ввода
/// - и т.д.
/// Позволяет в одном месте задать внешний вид бОльшей части стандарных
/// компонентов Flutter, и потом не дублировать код для их визуальной настройки.
class ThemeBuilder {
  static const double cardBorderRadius = 16.0;
  static const double defaultPadding = 12.0;
  static const double defaultSmallPadding = 6.0;

  static SystemUiOverlayStyle get systemUiOverlayStyle =>
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      );

  static ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      dialogBackgroundColor: AppColors.dialogBackgroundColor,
      appBarTheme: AppBarTheme(
        color: AppColors.white,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: ThemeBuilder.systemUiOverlayStyle,
        titleTextStyle: const TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
      ),
      searchBarTheme: buildSearchBarTheme(),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        filled: true,
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.error)) {
            return AppColors.textFieldError;
          } else if (states.contains(WidgetState.focused)) {
            return AppColors.white;
          }
          return AppColors.textFieldGray;
        }),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14.0,
          horizontal: 16.0,
        ),
        labelStyle: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: AppColors.lightGray,
        ),
        floatingLabelStyle: const TextStyle(
          shadows: [
            Shadow(
              color: AppColors.midGray,
              offset: Offset(0, 14),
            ),
          ],
          fontSize: 12.0,
          color: Colors.transparent,
          decorationColor: AppColors.midGray,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(
          color: AppColors.hint,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.focusedBorder),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.errorBorder),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          minimumSize: const Size.fromHeight(48),
          textStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
          elevation: 0,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          foregroundColor: AppColors.black,
          disabledForegroundColor: AppColors.lightGray,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          minimumSize: const Size(52, 52),
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.focusedBorder,
        selectionColor: AppColors.focusedBorder,
        selectionHandleColor: AppColors.focusedBorder,
      ),
      pageTransitionsTheme: _buildPageTransitionsTheme(),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1.5,
        space: 1,
      ),
    );
  }

  static SearchBarThemeData buildSearchBarTheme() {
    return SearchBarThemeData(
      elevation: WidgetStatePropertyAll(3),
      side: WidgetStatePropertyAll(
        BorderSide(
          color: AppColors.grey.withOpacity(0.1),
        ),
      ),
      backgroundColor: WidgetStatePropertyAll(AppColors.white),
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      hintStyle: WidgetStatePropertyAll(const TextStyle(
        color: AppColors.black,
      )),
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: 13.0,
        ),
      ),
      constraints: BoxConstraints(
        minHeight: 48,
        maxHeight: 48,
      ),
    );
  }

  static PageTransitionsTheme _buildPageTransitionsTheme() {
    return const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      },
    );
  }

  static BoxDecoration get buildCardDecoration => BoxDecoration(
        boxShadow: [buildDefaultShadow],
        color: AppColors.white,
        borderRadius: BorderRadius.circular(cardBorderRadius),
      );

  static BoxShadow get buildDefaultShadow => BoxShadow(
        offset: Offset(0, 3),
        blurRadius: 4.0,
        spreadRadius: 1,
        color: AppColors.ligthGray,
      );

  static BoxDecoration get buildCircleDecoration => BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [buildDefaultShadow],
        color: AppColors.surfaceColor,
      );
}
