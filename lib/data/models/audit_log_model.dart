import 'package:json_annotation/json_annotation.dart';
part 'audit_log_model.g.dart';

@JsonSerializable()
class AuditLog {
  final int id;
  final int? userId;
  final String actionType;
  final int? targetId;
  final DateTime createdAt;

  AuditLog({
    required this.id,
    this.userId,
    required this.actionType,
    this.targetId,
    required this.createdAt,
  });
  factory AuditLog.fromJson(Map<String, dynamic> json) =>
      _$AuditLogFromJson(json);
  Map<String, dynamic> toJson() => _$AuditLogToJson(this);
}
