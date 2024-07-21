import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:locallense/apibase/repository/api_repository.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/model/question_flow_navigation_dm.dart';
import 'package:locallense/model/request/user_question/post_user_question_req.dart';
import 'package:locallense/model/response/questions/questions_res.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:locallense/values/strings.dart';
import 'package:mobx/mobx.dart';

part 'questionnaire_flow_store.g.dart';

class QuestionnaireFlowStore = _QuestionnaireFlowStore
    with _$QuestionnaireFlowStore;

abstract class _QuestionnaireFlowStore with Store {
  _QuestionnaireFlowStore({
    // ignore: unused_element
    this.questionFlowNavigationDm,
  }) {
    initialize();
  }

  QuestionFlowNavigationDm? questionFlowNavigationDm;

  PageController pageController = PageController();

  @observable
  String questionnaireFlowName = '';

  @observable
  int currentPage = 0;

  @observable
  int totalPage = 0;

  @observable
  bool continueBtnEnabled = false;

  LocationPreferences? selectedPreferenceLocation;
  List<QuestionsRes> questionResList = [];

  Observable<List<QuestionsRes>> questionnaire = Observable([]);

  @observable
  NetworkState questionState = NetworkState.idle;

  @observable
  NetworkState submitQuestionnaireState = NetworkState.idle;

  Future<void> initialize() async {
    questionnaire.value.addAll(questionFlowNavigationDm?.questions ?? []);
    selectedPreferenceLocation = questionFlowNavigationDm?.locationPreferences;
    questionnaireFlowName = (selectedPreferenceLocation?.isHospital ?? false)
        ? str.hospitalQuestionnaire
        : (selectedPreferenceLocation?.isCafeRestaurant ?? false)
            ? 'Cafe/Restaurant questionnaire'
            : 'Tourist attraction questionnaire';
    totalPage = questionnaire.value.length;
  }

  void selectOption(int index, QuestionsRes questionnaireDm) {
    final option = questionnaireDm.options.elementAt(index);
    if (questionnaireDm.isMultiChoice ?? false) {
      option.selected = !option.selected;
      final isAnyValueSelected = questionnaireDm.options.any(
        (element) => element.selected,
      );
      continueBtnEnabled = isAnyValueSelected;
    } else {
      for (final i in questionnaireDm.options) {
        i.selected = false;
      }
      option.selected = !option.selected;
      continueBtnEnabled = option.selected;
    }

    questionnaire.reportChanged();
  }

  // ignore: use_setters_to_change_properties
  void onPageChanged(int index) => currentPage = index;

  Future<void> nextPage() async {
    final isAnyValueSelected = questionnaire.value[currentPage].options.any(
      (element) => element.selected,
    );
    if (isAnyValueSelected) {
      continueBtnEnabled = false;
    }
    if (currentPage == totalPage - 1) {
      await postQuestionnaire();
      if (questionFlowNavigationDm?.isEdit ?? false) {
        navigation.pop();
      } else {
        unawaited(
          navigation.pushReplacementNamed(
            AppRoutes.homeScreen,
          ),
        );
      }
    }
    unawaited(
      pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      ),
    );
  }

  bool get yesSelected => questionnaire.value[currentPage].options.any(
        (element) => element.text == 'Yes' && element.selected,
      );

  bool get isFilterChipContent =>
      questionnaire.value[currentPage].isDropDown ?? false;

  bool selectedDocSpecialization(
    String title,
  ) =>
      chipList.contains(
        title,
      );

  ObservableList<String> chipList = ObservableList();

  void chipSelect(
    String title, {
    required bool selected,
  }) {
    if (selected) {
      chipList.add(title);
    } else {
      chipList.remove(title);
    }
  }

  Future<void> postQuestionnaire() async {
    try {
      submitQuestionnaireState = NetworkState.loading;
      const questionAnswer = PostUserQuestionReq(
        questionsAndOptions: [],
      );
      for (final x in questionnaire.value) {
        for (final y in x.options) {
          questionAnswer.questionsAndOptions.add(
            UserQuestionAndOption(
              questionId: x.id,
              optionId: y.id,
            ),
          );
        }
      }
      await APIRepository.instance.postUserQuestionAnswer(
        questionAnswer,
      );
      submitQuestionnaireState = NetworkState.success;
    } catch (e) {
      submitQuestionnaireState = NetworkState.error;
    }
  }
}
