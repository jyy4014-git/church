// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  category: json['category'] as String,
  floor: json['floor'] as String,
  xRatio: (json['x_ratio'] as num).toDouble(),
  yRatio: (json['y_ratio'] as num).toDouble(),
  thumbnail_url: json['thumbnail_url'] as String?,
  detail_image_url: json['detail_image_url'] as String?,
  directions: json['directions'] as String?,
);

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'category': instance.category,
  'floor': instance.floor,
  'x_ratio': instance.xRatio,
  'y_ratio': instance.yRatio,
  'thumbnail_url': instance.thumbnail_url,
  'detail_image_url': instance.detail_image_url,
  'directions': instance.directions,
};
