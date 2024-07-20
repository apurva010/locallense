import 'package:json_annotation/json_annotation.dart';

part 'google_login_res.g.dart';

@JsonSerializable()
class GoogleLoginRes {
  const GoogleLoginRes({
    required this.accessToken,
    required this.expiryTimeUtc,
  });

  factory GoogleLoginRes.fromJson(Map<String, dynamic> json) =>
      _$GoogleLoginResFromJson(json);

  final String accessToken;
  final DateTime expiryTimeUtc;

  Map<String, dynamic> toJson() => _$GoogleLoginResToJson(this);
}
