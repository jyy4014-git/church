import 'package:json_annotation/json_annotation.dart';

part 'search_history_model.g.dart';

@JsonSerializable()
class SearchHistory {
  final int id;
  final int? userId;
  final String query;
  final DateTime? expiresAt;
  final DateTime createdAt;

  SearchHistory({
    required this.id,
    this.userId,
    required this.query,
    this.expiresAt,
    required this.createdAt,
  });

  factory SearchHistory.fromJson(Map<String, dynamic> json) =>
      _$SearchHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$SearchHistoryToJson(this);
}
