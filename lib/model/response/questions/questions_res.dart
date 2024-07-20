import 'package:json_annotation/json_annotation.dart';

part 'questions_res.g.dart';

@JsonSerializable()
class QuestionsRes {
  const QuestionsRes({
    required this.id,
    required this.text,
    required this.options,
  });

  factory QuestionsRes.fromJson(Map<String, dynamic> json) =>
      _$QuestionsResFromJson(json);

  final String id;
  final String text;
  final List<OptionData> options;

  Map<String, dynamic> toJson() => _$QuestionsResToJson(this);
}

@JsonSerializable()
class OptionData {
  const OptionData({
    required this.id,
    required this.text,
  });

  factory OptionData.fromJson(Map<String, dynamic> json) =>
      _$OptionDataFromJson(json);

  final String id;
  final String text;

  Map<String, dynamic> toJson() => _$OptionDataToJson(this);
}
