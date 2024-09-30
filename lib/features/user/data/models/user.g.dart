// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userId: (json['userId'] as num).toInt(),
      name: json['name'] as String?,
      lastname: json['lastname'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      login: json['login'] as String?,
      dateOfBirth: _$JsonConverterFromJson<int, DateTime>(
          json['dateOfBirth'], const DateTimeJsonConverter().fromJson),
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => CustomFile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'lastname': instance.lastname,
      'phone': instance.phone,
      'email': instance.email,
      'login': instance.login,
      'dateOfBirth': _$JsonConverterToJson<int, DateTime>(
          instance.dateOfBirth, const DateTimeJsonConverter().toJson),
      'images': instance.images,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
