import 'package:locallense/model/response/questions/questions_res.dart';
import 'package:locallense/values/enumeration.dart';

class QuestionFlowNavigationDm {
  QuestionFlowNavigationDm({
    required this.questions,
    this.locationPreferences,
  });

  final List<QuestionsRes> questions;
  final LocationPreferences? locationPreferences;
}
