import 'package:json_annotation/json_annotation.dart';

part 'post_user_question_req.g.dart';

@JsonSerializable()
class PostUserQuestionReq {
  const PostUserQuestionReq({
    required this.questionsAndOptions,
  });

  factory PostUserQuestionReq.fromJson(Map<String, dynamic> json) =>
      _$PostUserQuestionReqFromJson(json);

  final List<UserQuestionAndOption> questionsAndOptions;

  Map<String, dynamic> toJson() => _$PostUserQuestionReqToJson(this);
}

@JsonSerializable()
class UserQuestionAndOption {
  const UserQuestionAndOption({
    required this.questionId,
    required this.optionId,
  });

  factory UserQuestionAndOption.fromJson(Map<String, dynamic> json) =>
      _$UserQuestionAndOptionFromJson(json);

  final String questionId;
  final String optionId;

  Map<String, dynamic> toJson() => _$UserQuestionAndOptionToJson(this);
}
