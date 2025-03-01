// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuditLog _$AuditLogFromJson(Map<String, dynamic> json) => AuditLog(
  id: (json['id'] as num).toInt(),
  userId: (json['userId'] as num?)?.toInt(),
  actionType: json['actionType'] as String,
  targetId: (json['targetId'] as num?)?.toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$AuditLogToJson(AuditLog instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'actionType': instance.actionType,
  'targetId': instance.targetId,
  'createdAt': instance.createdAt.toIso8601String(),
};
