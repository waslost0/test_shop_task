// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      productId: (json['productId'] as num).toInt(),
      name: json['name'] as String,
      createdAt: (json['createdAt'] as num).toInt(),
      price: (json['price'] as num?)?.toDouble(),
      imageUrl: json['imageUrl'] as String?,
      productDescription: json['productDescription'] as String?,
      rating: json['rating'] as num?,
      isFavorite: json['isFavorite'] == null
          ? false
          : const BoolJsonConverter().fromJson(json['isFavorite']),
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => CustomFile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'productDescription': instance.productDescription,
      'rating': instance.rating,
      'isFavorite': const BoolJsonConverter().toJson(instance.isFavorite),
      'images': instance.images,
    };
