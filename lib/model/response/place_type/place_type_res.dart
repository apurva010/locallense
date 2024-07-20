import 'package:json_annotation/json_annotation.dart';

part 'place_type_res.g.dart';

@JsonSerializable()
class PlaceTypeRes {
  const PlaceTypeRes({
    required this.id,
    required this.value,
  });

  factory PlaceTypeRes.fromJson(Map<String, dynamic> json) =>
      _$PlaceTypeResFromJson(json);

  final String id;
  final String value;

  Map<String, dynamic> toJson() => _$PlaceTypeResToJson(this);
}
