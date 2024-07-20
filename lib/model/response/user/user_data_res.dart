import 'package:json_annotation/json_annotation.dart';

part 'user_data_res.g.dart';

@JsonSerializable()
class UserDataRes {
  UserDataRes({
    required this.firstName,
    required this.lastName,
    required this.profileUrl,
    required this.email,
    required this.loginProvider,
  });

  factory UserDataRes.fromJson(Map<String, dynamic> json) =>
      _$UserDataResFromJson(json);
  final String firstName;
  @JsonKey(defaultValue: '')
  final String lastName;
  @JsonKey(defaultValue: '')
  final String profileUrl;
  final String email;
  final int loginProvider;

  Map<String, dynamic> toJson() => _$UserDataResToJson(this);
}
