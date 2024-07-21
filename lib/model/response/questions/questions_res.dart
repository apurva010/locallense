import 'package:json_annotation/json_annotation.dart';

part 'questions_res.g.dart';

@JsonSerializable()
class QuestionsRes {
  const QuestionsRes({
    required this.id,
    required this.text,
    required this.options,
    required this.type,
    this.isMultiChoice,
    this.isDropDown,
  });

  factory QuestionsRes.fromJson(Map<String, dynamic> json) =>
      _$QuestionsResFromJson(json);

  final String id;
  final String text;
  final int type;
  final List<OptionData> options;
  final bool? isMultiChoice;
  final bool? isDropDown;

  Map<String, dynamic> toJson() => _$QuestionsResToJson(this);
}

@JsonSerializable()
class OptionData {
  OptionData({
    required this.id,
    required this.text,
    this.selected = false,
  });

  factory OptionData.fromJson(Map<String, dynamic> json) =>
      _$OptionDataFromJson(json);

  final String id;
  final String text;
  bool selected;

  Map<String, dynamic> toJson() => _$OptionDataToJson(this);
}
