// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'church_map_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChurchMap _$ChurchMapFromJson(Map<String, dynamic> json) => ChurchMap(
  id: (json['id'] as num).toInt(),
  mapImageUrl: json['mapImageUrl'] as String,
  buildingId: (json['buildingId'] as num?)?.toInt(),
  description: json['description'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ChurchMapToJson(ChurchMap instance) => <String, dynamic>{
  'id': instance.id,
  'mapImageUrl': instance.mapImageUrl,
  'buildingId': instance.buildingId,
  'description': instance.description,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
