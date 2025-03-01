// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pathway_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pathway _$PathwayFromJson(Map<String, dynamic> json) => Pathway(
  id: (json['id'] as num).toInt(),
  fromLocationId: (json['fromLocationId'] as num?)?.toInt(),
  toLocationId: (json['toLocationId'] as num?)?.toInt(),
  pathDescription: json['pathDescription'] as String?,
  distanceMetric: (json['distanceMetric'] as num?)?.toInt(),
);

Map<String, dynamic> _$PathwayToJson(Pathway instance) => <String, dynamic>{
  'id': instance.id,
  'fromLocationId': instance.fromLocationId,
  'toLocationId': instance.toLocationId,
  'pathDescription': instance.pathDescription,
  'distanceMetric': instance.distanceMetric,
};
