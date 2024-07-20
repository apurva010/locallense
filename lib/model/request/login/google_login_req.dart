import 'package:json_annotation/json_annotation.dart';

part 'google_login_req.g.dart';

@JsonSerializable()
class GoogleLoginReq {
  const GoogleLoginReq({required this.googleToken});

  factory GoogleLoginReq.fromJson(Map<String, dynamic> json) =>
      _$GoogleLoginReqFromJson(json);

  @JsonKey(name: 'token')
  final String googleToken;

  Map<String, dynamic> toJson() => _$GoogleLoginReqToJson(this);
}
