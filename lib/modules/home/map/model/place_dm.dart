import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:locallense/values/enumeration.dart';

part 'place_dm.g.dart';

@JsonSerializable()
class PlaceDm {
  PlaceDm({
    this.id,
    this.categories,
    this.address,
    this.geometry,
    this.openHours,
    this.types,
    this.ratting,
    this.name,
    this.matchScore,
    this.reason,
    this.tags,
    this.imgUrl,
    this.latitude,
    this.longitude,
  });

  factory PlaceDm.fromJson(Map<String, dynamic> json) =>
      _$PlaceDmFromJson(json);

  String? id;
  @JsonKey(name: 'Categories')
  String? categories;
  @JsonKey(name: 'formatted_address')
  String? address;
  final Geometry? geometry;
  String? openHours;
  List<String>? types;
  @JsonKey(name: 'rating')
  double? ratting;
  @JsonKey(name: 'location')
  String? name;
  @JsonKey(name: 'match_score')
  int? matchScore;
  String? reason;
  String? imgUrl;
  List<String>? tags;
  double? latitude;
  double? longitude;

  Map<String, dynamic> toJson() => _$PlaceDmToJson(this);
  PrefType get type => PrefType.getMatchedPref(types ?? []);

  LatLng get latLng => LatLng(latitude ?? (geometry!.location!.lat!),
      longitude ?? (geometry!.location!.lng!));
}

@JsonSerializable()
class Geometry {
  Geometry({
    this.location,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return _$GeometryFromJson(json);
  }

  final Location? location;
  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}

@JsonSerializable()
class Location {
  Location({this.lat, this.lng});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  double? lat;
  double? lng;

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Viewport {
  Viewport({this.northeast, this.southwest});

  factory Viewport.fromJson(Map<String, dynamic> json) =>
      _$ViewportFromJson(json);
  Location? northeast;
  Location? southwest;

  Map<String, dynamic> toJson() => _$ViewportToJson(this);
}

@JsonSerializable()
class OpeningHours {
  OpeningHours({this.openNow, this.periods});

  factory OpeningHours.fromJson(Map<String, dynamic> json) =>
      _$OpeningHoursFromJson(json);
  bool? openNow;
  List<Period>? periods;

  Map<String, dynamic> toJson() => _$OpeningHoursToJson(this);
}

@JsonSerializable()
class Period {
  Period({this.close, this.open});

  factory Period.fromJson(Map<String, dynamic> json) => _$PeriodFromJson(json);
  DayTime? close;
  DayTime? open;

  Map<String, dynamic> toJson() => _$PeriodToJson(this);
}

@JsonSerializable()
class DayTime {
  DayTime({this.day, this.time});

  factory DayTime.fromJson(Map<String, dynamic> json) =>
      _$DayTimeFromJson(json);
  int? day;
  String? time;

  Map<String, dynamic> toJson() => _$DayTimeToJson(this);
}

@JsonSerializable()
class Photo {
  Photo({
    this.height,
    this.htmlAttributions,
    this.photoReference,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
  int? height;
  List<String>? htmlAttributions;
  String? photoReference;

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
