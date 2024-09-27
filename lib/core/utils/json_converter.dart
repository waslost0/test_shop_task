import 'package:freezed_annotation/freezed_annotation.dart';

class BoolJsonConverter implements JsonConverter<bool, dynamic> {
  const BoolJsonConverter();

  @override
  bool fromJson(dynamic json) {
    if (json is int) {
      return (json == 1) ? true : false;
    }
    return json as bool;
  }

  @override
  int toJson(bool object) => (object) ? 1 : 0;
}

class DateTimeJsonConverter implements JsonConverter<DateTime, int> {
  const DateTimeJsonConverter();

  @override
  DateTime fromJson(int json) {
    final result = DateTime.fromMillisecondsSinceEpoch(json * 1000);
    return result;
  }

  @override
  int toJson(DateTime object) => (object.millisecondsSinceEpoch) ~/ 1000;
}
