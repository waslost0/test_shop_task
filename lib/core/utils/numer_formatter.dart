import 'package:intl/intl.dart';

extension NumberFormatExtension on NumberFormat {
  static NumberFormat get defaultCurrency =>
      NumberFormat.decimalPattern('RU_ru');

  static NumberFormat get currencyWithoutName =>
      NumberFormat.simpleCurrency(locale: "RU_ru", name: "");
}

extension PriceFormatExtencion on double {
  String get formatCurrency =>
      "${NumberFormatExtension.defaultCurrency.format(this)} ₽";
}
