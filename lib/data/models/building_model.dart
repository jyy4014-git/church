import 'package:json_annotation/json_annotation.dart';
part 'building_model.g.dart';

@JsonSerializable()
class Building {
  final int id;
  final String name;
  final String mapImageUrl;

  Building({required this.id, required this.name, required this.mapImageUrl});
  factory Building.fromJson(Map<String, dynamic> json) =>
      _$BuildingFromJson(json);
  Map<String, dynamic> toJson() => _$BuildingToJson(this);
}
