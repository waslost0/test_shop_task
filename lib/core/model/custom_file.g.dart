// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomFileImpl _$$CustomFileImplFromJson(Map<String, dynamic> json) =>
    _$CustomFileImpl(
      url: json['url'] as String?,
      blurHash: json['blurHash'] as String?,
      fileId: (json['fileId'] as num?)?.toInt(),
      previewUrl: (json['previewUrl'] as num?)?.toInt(),
      mimeType: (json['mimeType'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CustomFileImplToJson(_$CustomFileImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'blurHash': instance.blurHash,
      'fileId': instance.fileId,
      'previewUrl': instance.previewUrl,
      'mimeType': instance.mimeType,
    };
