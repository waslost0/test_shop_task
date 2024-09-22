// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      categoryId: (json['categoryId'] as num).toInt(),
      title: json['title'] as String,
      createdAt: (json['createdAt'] as num).toInt(),
      updatedAt: (json['updatedAt'] as num).toInt(),
      isPublic: json['isPublic'] == null
          ? true
          : const BoolJsonConverter().fromJson(json['isPublic']),
      hasSubcategories: json['hasSubcategories'] == null
          ? false
          : const BoolJsonConverter().fromJson(json['hasSubcategories']),
      parentCategoryId: (json['parentCategoryId'] as num?)?.toInt(),
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'title': instance.title,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isPublic': const BoolJsonConverter().toJson(instance.isPublic),
      'hasSubcategories':
          const BoolJsonConverter().toJson(instance.hasSubcategories),
      'parentCategoryId': instance.parentCategoryId,
      'description': instance.description,
      'icon': instance.icon,
    };
