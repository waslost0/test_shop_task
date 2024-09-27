import 'package:intl/intl.dart';

extension NumberFormatExtension on NumberFormat {
  static NumberFormat get defaultCurrency =>
      NumberFormat.simpleCurrency(locale: "RU_ru", name: "₽");

  static NumberFormat get currencyWithoutName =>
      NumberFormat.simpleCurrency(locale: "RU_ru", name: "");
}
