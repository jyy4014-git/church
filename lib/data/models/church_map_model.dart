import 'package:json_annotation/json_annotation.dart';
part 'church_map_model.g.dart';

@JsonSerializable()
class ChurchMap {
  final int id;
  final String mapImageUrl;
  final int? buildingId;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;

  ChurchMap({
    required this.id,
    required this.mapImageUrl,
    this.buildingId,
    this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChurchMap.fromJson(Map<String, dynamic> json) =>
      _$ChurchMapFromJson(json);
  Map<String, dynamic> toJson() => _$ChurchMapToJson(this);
}
