import 'package:flutter/material.dart';
import 'package:locallense/model/questionnaire_dm/questionnaire_dm.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/utils/typedefs.dart';
import 'package:locallense/values/app_colors.dart';

class QuestionnaireOptionWidget extends StatelessWidget {
  const QuestionnaireOptionWidget({
    required this.option,
    required this.questionnaire,
    required this.onTap,
    required this.index,
    this.enableCheckIcon = false,
    this.selectedColor,
    this.unSelectedColor,
    this.selectedTxtColor,
    this.unSelectedTxtColor,
    super.key,
  });

  final QuestionnaireDm questionnaire;
  final OptionDm option;
  final bool enableCheckIcon;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final Color? selectedTxtColor;
  final Color? unSelectedTxtColor;
  final int index;
  final SelectOption onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GestureDetector(
            onTap: () => onTap.call(
              index,
              questionnaire,
            ),
            child: Container(
              padding: const EdgeInsets.all(
                16,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: option.isSelected
                      ? context.themeColor.primaryColor ??
                          AppColors.primaryColor
                      : context.themeColor.unFilledProgressColor ??
                          AppColors.unFilledProgressColor,
                ),
                color: option.isSelected
                    ? selectedColor ?? context.themeColor.primaryColor
                    : unSelectedColor ?? context.themeColor.whiteColor,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (enableCheckIcon)
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        size: 24,
                        option.isSelected
                            ? Icons.check_circle
                            : Icons.circle_outlined,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  Expanded(
                    child: Text(
                      option.option,
                      style:
                          context.textStyleTheme.bodyMediumSemiBold?.copyWith(
                        color: option.isSelected
                            ? selectedTxtColor ?? context.themeColor.whiteColor
                            : unSelectedTxtColor ??
                                context.themeColor.blackColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
