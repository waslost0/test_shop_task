import 'package:intl/intl.dart';

extension DateTimeHelper on DateTime {
  DateTime get onlyDate => DateTime(year, month, day);

  String formattedWithFormat(String format) {
    var formatter = DateFormat(format);
    return formatter.format(this);
  }

  String formatDateTime() {
    return formattedWithFormat('dd.MM.yyyy, HH:mm');
  }

  String formatTime() {
    return formattedWithFormat('HH:mm');
  }

  String formatDate() {
    return formattedWithFormat('dd.MM.yyyy');
  }
}
