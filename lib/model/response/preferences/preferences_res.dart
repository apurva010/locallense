import 'package:json_annotation/json_annotation.dart';

part 'preferences_res.g.dart';

@JsonSerializable()
class PreferencesRes {
  PreferencesRes({
    required this.id,
    required this.preference,
    this.isSelected = false,
  });

  factory PreferencesRes.fromJson(Map<String, dynamic> json) =>
      _$PreferencesResFromJson(json);

  final String id;
  @JsonKey(name: 'preferenceName')
  final String preference;

  @JsonKey(includeToJson: false, includeFromJson: false)
  bool isSelected;

  Map<String, dynamic> toJson() => _$PreferencesResToJson(this);
}
