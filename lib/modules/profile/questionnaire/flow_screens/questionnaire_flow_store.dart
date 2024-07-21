import 'package:flutter/cupertino.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/model/questionnaire_dm/questionnaire_dm.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:locallense/values/strings.dart';
import 'package:mobx/mobx.dart';

part 'questionnaire_flow_store.g.dart';

class QuestionnaireFlowStore = _QuestionnaireFlowStore
    with _$QuestionnaireFlowStore;

abstract class _QuestionnaireFlowStore with Store {
  _QuestionnaireFlowStore({
    // ignore: unused_element
    this.selectedPreferenceLocation,
  });

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

  List<Observable<QuestionnaireDm>> questionnaire = [];

  void initialize() {
    if (selectedPreferenceLocation?.isHospital ?? false) {
      questionnaireFlowName = str.hospitalQuestionnaire;
      questionnaire = [
        Observable(
          QuestionnaireDm(
            question: str.hospitalFirstQuestion,
            optionDm: [
              OptionDm(
                option: str.veryImportant,
              ),
              OptionDm(
                option: str.somewhatImportant,
              ),
              OptionDm(
                option: str.notImportant,
              ),
            ],
          ),
        ),
        Observable(
          QuestionnaireDm(
            question: str.hospitalSecondQuestion,
            optionDm: [
              OptionDm(
                option: str.yes,
              ),
              OptionDm(
                option: str.no,
              ),
            ],
            isFilterChipContent: true,
          ),
        ),
        Observable(
          QuestionnaireDm(
            question: str.hospitalThirdQuestion,
            optionDm: [
              OptionDm(
                option: str.seniorConsultant,
              ),
              OptionDm(
                option: str.specialist,
              ),
              OptionDm(
                option: str.generalPractitioner,
              ),
              OptionDm(
                option: str.noPreferences,
              ),
            ],
          ),
        ),
      ];
    } else if (selectedPreferenceLocation?.isCafeRestaurant ?? false) {
      questionnaireFlowName = 'Cafe/Restaurant questionnaire';
      questionnaire = [
        Observable(
          QuestionnaireDm(
            question: str.cafeRestaurantFirstQue,
            optionDm: [
              OptionDm(
                option: 'Cafe',
              ),
              OptionDm(
                option: 'Restaurant',
              ),
              OptionDm(
                option: 'Both',
              ),
            ],
          ),
        ),
        Observable(
          QuestionnaireDm(
            question:
                'Do you have specific cuisine preferences for nearby dining options?',
            optionDm: [
              OptionDm(
                option: str.yes,
              ),
              OptionDm(
                option: str.no,
              ),
            ],
            isFilterChipContent: true,
          ),
        ),
        Observable(
          QuestionnaireDm(
            question:
                'Are you looking for PGs located in areas with a vibrant social scene or nightlife?',
            optionDm: [
              OptionDm(
                option: str.yes,
              ),
              OptionDm(
                option: str.no,
              ),
            ],
          ),
        ),
        Observable(
          QuestionnaireDm(
            question:
                'Are you interested in PGs near venues that host special events or themed nights at cafes/restaurants?',
            optionDm: [
              OptionDm(
                option: str.yes,
              ),
              OptionDm(
                option: str.no,
              ),
            ],
          ),
        ),
      ];
    } else {
      questionnaireFlowName = 'Tourist attraction questionnaire';
      questionnaire = [
        Observable(
          QuestionnaireDm(
            question:
                'Do you prefer PGs located in areas that offer leisure activities such as dining, cafes, and recreational facilities?',
            optionDm: [
              OptionDm(
                option: 'Yes, I want leisure options nearby.',
              ),
              OptionDm(
                option: "No, I'm focused on other location aspects.",
              ),
            ],
          ),
        ),
        Observable(
          QuestionnaireDm(
            question:
                'Do you have specific cuisine preferences for nearby dining options?',
            optionDm: [
              OptionDm(
                option: 'Shopping Centers',
              ),
              OptionDm(
                option: 'Movie Theaters',
              ),
              OptionDm(
                option: 'Amusement Parks',
              ),
              OptionDm(
                option: 'Museums',
              ),
            ],
            isMultiSelected: true,
          ),
        ),
      ];
    }
    totalPage = questionnaire.length;
  }

  void selectOption(int index, QuestionnaireDm questionnaireDm) {
    final option = questionnaireDm.optionDm.elementAt(index);
    if (questionnaireDm.isMultiSelected) {
      option.isSelected = !option.isSelected;
      final isAnyValueSelected = questionnaireDm.optionDm.any(
        (element) => element.isSelected,
      );
      continueBtnEnabled = isAnyValueSelected;
    } else {
      for (final i in questionnaireDm.optionDm) {
        i.isSelected = false;
      }
      option.isSelected = !option.isSelected;
      continueBtnEnabled = option.isSelected;
    }

    questionnaire.first.reportChanged();
  }

  void onPageChanged(int index) => currentPage = index;

  void nextPage() {
    final isAnyValueSelected = questionnaire[currentPage].value.optionDm.any(
          (element) => element.isSelected,
        );
    if (isAnyValueSelected) {
      continueBtnEnabled = false;
    }
    if (currentPage == totalPage - 1) {
      navigation.pushNamed(
        AppRoutes.homeScreen,
      );
    }
    pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  bool get yesSelected => questionnaire[currentPage].value.optionDm.any(
        (element) => element.option == 'Yes' && element.isSelected,
      );

  bool get isFilterChipContent =>
      questionnaire[currentPage].value.isFilterChipContent;

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
}
