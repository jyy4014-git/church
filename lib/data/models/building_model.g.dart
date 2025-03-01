// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'building_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Building _$BuildingFromJson(Map<String, dynamic> json) => Building(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  mapImageUrl: json['mapImageUrl'] as String,
);

Map<String, dynamic> _$BuildingToJson(Building instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'mapImageUrl': instance.mapImageUrl,
};
