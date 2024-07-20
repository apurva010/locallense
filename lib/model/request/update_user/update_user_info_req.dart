import 'package:json_annotation/json_annotation.dart';

part 'update_user_info_req.g.dart';

@JsonSerializable()
class UpdateUserInfoReq {
  const UpdateUserInfoReq({
    required this.firstName,
    required this.lastName,
  });

  factory UpdateUserInfoReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserInfoReqFromJson(json);

  final String firstName;
  final String lastName;

  Map<String, dynamic> toJson() => _$UpdateUserInfoReqToJson(this);
}
