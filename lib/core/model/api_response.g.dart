// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseImpl _$$ApiResponseImplFromJson(Map<String, dynamic> json) =>
    _$ApiResponseImpl(
      meta: json['meta'] == null
          ? const Meta(success: true)
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'] ?? null,
    );

Map<String, dynamic> _$$ApiResponseImplToJson(_$ApiResponseImpl instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      success: json['success'] as bool? ?? false,
      error: json['error'] as String? ?? 'Unknown error',
      invalidAccessToken: json['invalidAccessToken'] as bool? ?? false,
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'invalidAccessToken': instance.invalidAccessToken,
    };
