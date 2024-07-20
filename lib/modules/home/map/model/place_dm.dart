import 'package:json_annotation/json_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:locallense/values/enumeration.dart';

part 'place_dm.g.dart';

@JsonSerializable()
class PlaceDm {
  PlaceDm({
    required this.id,
    required this.name,
    required this.address,
    required this.openHours,
    required this.ratting,
    required this.latitude,
    required this.longitude,
    required this.type,
    this.imgUrl,
  });

  factory PlaceDm.fromJson(Map<String, dynamic> json) =>
      _$PlaceDmFromJson(json);

  final String id;
  final String name;
  final String address;
  final String openHours;
  final double ratting;
  final String? imgUrl;
  final double latitude;
  final double longitude;
  final PrefType type;

  LatLng get latLng => LatLng(latitude, longitude);
  Map<String, dynamic> toJson() => _$PlaceDmToJson(this);
}
