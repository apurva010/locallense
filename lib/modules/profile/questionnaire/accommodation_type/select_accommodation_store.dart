import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:locallense/apibase/repository/api_repository.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/model/question_flow_navigation_dm.dart';
import 'package:locallense/model/request/user_question/post_user_question_req.dart';
import 'package:locallense/model/response/questions/questions_res.dart';
import 'package:locallense/model/response/questions/selected_question_res.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/utils/helpers/helpers.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:locallense/values/strings.dart';
import 'package:mobx/mobx.dart';

part 'select_accommodation_store.g.dart';

class SelectAccommodationStore = _SelectAccommodationStore
    with _$SelectAccommodationStore;

abstract class _SelectAccommodationStore with Store {
  _SelectAccommodationStore({
    this.isEditScreen = false,
  }) {
    initialize();
  }

  final bool isEditScreen;

  @observable
  int currentPage = 0;

  int totalPage = 3;

  @observable
  bool continueBtnEnabled = false;

  @observable
  LocationPreferences? selectedPreferenceLocation;

  PageController pageController = PageController();

  Observable<List<QuestionsRes>> pgForm = Observable([]);
  Observable<List<QuestionsRes>> hospitalForm = Observable([]);
  Observable<List<QuestionsRes>> cafeForm = Observable([]);
  Observable<List<QuestionsRes>> touristForm = Observable([]);

  @observable
  NetworkState pgQuestionState = NetworkState.idle;

  @observable
  NetworkState submitPGQuestionState = NetworkState.idle;

  List<SelectedQuestionRes>? selectedQueResult;

  Future<void> initialize() async {
    await getPGQuestions();
  }

  Future<void> getPGQuestions() async {
    try {
      pgQuestionState = NetworkState.loading;
      final result = await APIRepository.instance.getQuestions().getResult();
      if (isEditScreen) {
        selectedQueResult =
            await apiRepository.getSelectedQuestion().getResult();
      }
      for (final i in result) {
        if (i.type == 1) {
          hospitalForm.value.add(i);
        } else if (i.type == 2) {
          cafeForm.value.add(i);
        } else if (i.type == 3) {
          touristForm.value.add(i);
        } else {
          // if (selectedQueResult != null) {
          //   final selectedIndex =
          //       selectedQueResult?.indexWhere((e) => e.questionId == i.id);
          //   if (selectedIndex != -1) {
          //     final selectedQue = selectedQueResult![selectedIndex!];
          //     for (final option in i.options) {
          //       if (selectedQue.options.any((e) => e == option.id)) {
          //         option.selected = true;
          //       }
          //     }
          //   }
          // }
          pgForm.value.add(i);
        }
      }
      totalPage = pgForm.value.length;
      pgForm.reportChanged();
      pgQuestionState = NetworkState.success;
    } catch (e, s) {
      pgQuestionState = NetworkState.error;
      showErrorToast(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }

  void onPageChanged(int index) => currentPage = index;

  Future<void> nextPage() async {
    final isAnyValueSelected = pgForm.value[currentPage].options.any(
      (element) => element.selected,
    );
    if (isAnyValueSelected) {
      continueBtnEnabled = false;
    }
    if (currentPage == totalPage - 1) {
      await postPGForm();
      navigateToFlow();
    }
    unawaited(
      pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      ),
    );
  }

  void selectOption(int index, QuestionsRes questionnaireDm) {
    final option = questionnaireDm.options.elementAt(index);
    if (currentPage == totalPage - 1) {
      selectedPreferenceLocation = parseLocationPref(option.text);
    }
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

    pgForm.reportChanged();
  }

  void navigateToFlow() {
    navigation.pushReplacementNamed(
      AppRoutes.questionnaireFlowScreen,
      arguments: QuestionFlowNavigationDm(
        questions: getFormQuestion(),
        isEdit: isEditScreen,
        locationPreferences: selectedPreferenceLocation,
      ),
    );
  }

  List<QuestionsRes> getFormQuestion() {
    if (selectedPreferenceLocation?.isHospital ?? false) {
      return hospitalForm.value;
    } else if (selectedPreferenceLocation?.isCafeRestaurant ?? false) {
      return cafeForm.value;
    } else if (selectedPreferenceLocation?.isTouristAttraction ?? false) {
      return touristForm.value;
    } else {
      return <QuestionsRes>[];
    }
  }

  Future<void> postPGForm() async {
    try {
      submitPGQuestionState = NetworkState.loading;
      PostUserQuestionReq questionAnswer = PostUserQuestionReq(
        questionsAndOptions: [],
      );
      for (final x in pgForm.value) {
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
      submitPGQuestionState = NetworkState.success;
    } catch (e) {
      submitPGQuestionState = NetworkState.error;
    }
  }
}
