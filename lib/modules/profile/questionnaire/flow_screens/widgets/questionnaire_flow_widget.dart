import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locallense/model/questionnaire_dm/questionnaire_dm.dart';
import 'package:locallense/modules/profile/questionnaire/flow_screens/questionnaire_flow_store.dart';
import 'package:locallense/modules/profile/questionnaire/flow_screens/widgets/questionnaire_option_widget.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/utils/typedefs.dart';
import 'package:locallense/values/app_colors.dart';
import 'package:locallense/values/enumeration.dart';

class QuestionnaireFlowWidget extends StatelessObserverWidget {
  const QuestionnaireFlowWidget({
    required this.title,
    required this.questionnaire,
    required this.onTap,
    this.enableCheckIcon = false,
    super.key,
  });

  final String title;
  final QuestionnaireDm questionnaire;
  final SelectOption onTap;
  final bool enableCheckIcon;

  @override
  Widget build(BuildContext context) {
    final store = context.provide<QuestionnaireFlowStore>();
    return ListView(
      padding: const EdgeInsets.only(
        top: 14,
      ),
      children: [
        Text(
          title,
          style: context.textStyleTheme.headLine6,
        ),
        const SizedBox(
          height: 20,
        ),
        ...List.generate(
          questionnaire.optionDm.length,
          (index) {
            return Observer(
              builder: (context) {
                return QuestionnaireOptionWidget(
                  questionnaire: questionnaire,
                  option: questionnaire.optionDm[index],
                  onTap: onTap,
                  index: index,
                  enableCheckIcon: questionnaire.isMultiSelected,
                  selectedTxtColor: questionnaire.isMultiSelected
                      ? context.themeColor.blackColor
                      : null,
                  selectedColor: questionnaire.isMultiSelected
                      ? context.themeColor.whiteColor
                      : null,
                );
              },
            );
          },
        ),
        if ((store.selectedPreferenceLocation?.isHospital ?? false) &&
            questionnaire.isFilterChipContent &&
            store.yesSelected) ...{
          Wrap(
            spacing: 5,
            children: DoctorSpecialization.values
                .map((DoctorSpecialization docSpecialization) {
              return Observer(
                builder: (context) {
                  final selected = store.selectedDocSpecialization(
                    docSpecialization.title,
                  );
                  return FilterChip(
                    label: Text(docSpecialization.title),
                    selected: selected,
                    selectedColor: AppColors.primaryColor,
                    backgroundColor: Colors.white,
                    showCheckmark: false,
                    labelStyle: TextStyle(
                      color: selected ? Colors.white : Colors.black,
                    ),
                    onSelected: (value) => store.chipSelect(
                      docSpecialization.title,
                      selected: value,
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
          Observer(
            builder: (context) => Text(
              'Looking for: ${store.chipList.map(
                    (e) => e,
                  ).join(
                    ', ',
                  )}',
            ),
          ),
        } else if ((store.selectedPreferenceLocation?.isCafeRestaurant ??
                false) &&
            questionnaire.isFilterChipContent &&
            store.yesSelected) ...{
          Wrap(
            spacing: 5,
            children: Cuisine.values.map((Cuisine cuisine) {
              return Observer(
                builder: (context) {
                  final selected = store.selectedDocSpecialization(
                    cuisine.title,
                  );
                  return FilterChip(
                    label: Text(cuisine.title),
                    selected: selected,
                    selectedColor: AppColors.primaryColor,
                    backgroundColor: Colors.white,
                    showCheckmark: false,
                    labelStyle: TextStyle(
                      color: selected ? Colors.white : Colors.black,
                    ),
                    onSelected: (value) => store.chipSelect(
                      cuisine.title,
                      selected: value,
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
          Observer(
            builder: (context) => Text(
              'Looking for: ${store.chipList.map(
                    (e) => e,
                  ).join(
                    ', ',
                  )}',
            ),
          ),
        },
      ],
    );
  }
}
