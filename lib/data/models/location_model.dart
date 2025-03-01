import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class Location {
  final int id;
  final String name;
  final String description;
  final String category;
  final String floor;
  @JsonKey(name: 'x_ratio')
  final double xRatio;
  @JsonKey(name: 'y_ratio')
  final double yRatio;
  final String? thumbnail_url;
  final String? detail_image_url;
  final String? directions;

  Location({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.floor,
    required this.xRatio,
    required this.yRatio,
    this.thumbnail_url,
    this.detail_image_url,
    this.directions,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
