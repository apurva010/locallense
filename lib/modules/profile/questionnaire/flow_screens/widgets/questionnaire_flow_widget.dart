import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locallense/model/response/questions/questions_res.dart';
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
  final QuestionsRes questionnaire;
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
          questionnaire.options.length,
          (index) {
            return Observer(
              builder: (context) {
                return QuestionnaireOptionWidget(
                  questionnaire: questionnaire,
                  option: questionnaire.options[index],
                  onTap: onTap,
                  index: index,
                  enableCheckIcon: questionnaire.isMultiChoice ?? false,
                  selectedTxtColor: questionnaire.isMultiChoice ?? false
                      ? context.themeColor.blackColor
                      : null,
                  selectedColor: questionnaire.isMultiChoice ?? false
                      ? context.themeColor.whiteColor
                      : null,
                );
              },
            );
          },
        ),
        if ((store.questionFlowNavigationDm?.locationPreferences?.isHospital ??
                false) &&
            (questionnaire.isDropDown ?? false) &&
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
        } else if ((store.questionFlowNavigationDm?.locationPreferences
                    ?.isCafeRestaurant ??
                false) &&
            (questionnaire.isDropDown ?? false) &&
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
