import 'package:flutter/cupertino.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/model/questionnaire_dm/questionnaire_dm.dart';
import 'package:locallense/utils/helpers/helpers.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:locallense/values/strings.dart';
import 'package:mobx/mobx.dart';

part 'select_accommodation_store.g.dart';

class SelectAccommodationStore = _SelectAccommodationStore
    with _$SelectAccommodationStore;

abstract class _SelectAccommodationStore with Store {
  @observable
  int currentPage = 0;

  int totalPage = 3;

  @observable
  bool continueBtnEnabled = false;

  @observable
  LocationPreferences? selectedPreferenceLocation;

  PageController pageController = PageController();

  List<Observable<QuestionnaireDm>> pgReferenceForm = [
    Observable(
      QuestionnaireDm(
        question: 'Select the type of accommodation you prefer',
        optionDm: [
          OptionDm(
            option: str.singleRoom,
          ),
          OptionDm(
            option: str.sharedRoom,
          ),
          OptionDm(
            option: str.bothWillWork,
          ),
        ],
      ),
    ),
    Observable(
      QuestionnaireDm(
        question:
            'Please select amenities and facilities that are important to you',
        optionDm: [
          OptionDm(
            option: str.wifi,
          ),
          OptionDm(
            option: str.airConditioning,
          ),
          OptionDm(
            option: str.kitchenAccess,
          ),
          OptionDm(
            option: str.laundryService,
          ),
          OptionDm(
            option: str.parkingSpace,
          ),
          OptionDm(
            option: str.gymFitness,
          ),
          OptionDm(
            option: str.studyworkDesk,
          ),
        ],
        isMultiSelected: true,
      ),
    ),
    Observable(
      QuestionnaireDm(
        question: 'What are your other nearby location preferences',
        optionDm: [
          OptionDm(
            option: str.hospitals,
          ),
          OptionDm(
            option: str.caferestaurant,
          ),
          OptionDm(
            option: str.touristAttraction,
          ),
        ],
      ),
    ),
  ];

  void onPageChanged(int index) => currentPage = index;

  void nextPage() {
    final isAnyValueSelected = pgReferenceForm[currentPage].value.optionDm.any(
          (element) => element.isSelected,
        );
    if (isAnyValueSelected) {
      continueBtnEnabled = false;
    }
    if (currentPage == totalPage - 1) {
      navigateToFlow();
    }
    pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  void selectOption(int index, QuestionnaireDm questionnaireDm) {
    final option = questionnaireDm.optionDm.elementAt(index);
    if (currentPage == totalPage - 1) {
      selectedPreferenceLocation = parseLocationPref(option.option);
    }
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

    pgReferenceForm.first.reportChanged();
  }

  void navigateToFlow() {
    navigation.pushNamed(
      AppRoutes.questionnaireFlowScreen,
      arguments: selectedPreferenceLocation,
    );
  }
}
