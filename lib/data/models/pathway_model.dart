import 'package:json_annotation/json_annotation.dart';
part 'pathway_model.g.dart';

@JsonSerializable()
class Pathway {
  final int id;
  final int? fromLocationId;
  final int? toLocationId;
  final String? pathDescription;
  final int? distanceMetric;

  Pathway({
    required this.id,
    this.fromLocationId,
    this.toLocationId,
    this.pathDescription,
    this.distanceMetric,
  });

  factory Pathway.fromJson(Map<String, dynamic> json) =>
      _$PathwayFromJson(json);
  Map<String, dynamic> toJson() => _$PathwayToJson(this);
}
