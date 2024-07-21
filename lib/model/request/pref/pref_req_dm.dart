import 'package:json_annotation/json_annotation.dart';

part 'pref_req_dm.g.dart';

@JsonSerializable()
class PrefReqDm {
  PrefReqDm({required this.preferences});

  factory PrefReqDm.fromJson(Map<String, dynamic> json) =>
      _$PrefReqDmFromJson(json);

  final List<String> preferences;

  Map<String, dynamic> toJson() => _$PrefReqDmToJson(this);
}
