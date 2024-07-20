import 'package:json_annotation/json_annotation.dart';

part 'preferences_res.g.dart';

@JsonSerializable()
class PreferencesRes {
  const PreferencesRes({
    required this.id,
    required this.placeName,
    required this.preferenceName,
  });

  factory PreferencesRes.fromJson(Map<String, dynamic> json) =>
      _$PreferencesResFromJson(json);

  final String id;
  final String placeName;
  final String preferenceName;

  Map<String, dynamic> toJson() => _$PreferencesResToJson(this);
}
