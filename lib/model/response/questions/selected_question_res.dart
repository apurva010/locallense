import 'package:json_annotation/json_annotation.dart';

part 'selected_question_res.g.dart';

@JsonSerializable()
class SelectedQuestionRes {
  SelectedQuestionRes({
    required this.questionId,
    required this.options,
  });

  factory SelectedQuestionRes.fromJson(Map<String, dynamic> json) =>
      _$SelectedQuestionResFromJson(json);

  final String questionId;
  final List<String> options;

  Map<String, dynamic> toJson() => _$SelectedQuestionResToJson(this);
}
