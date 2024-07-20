import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locallense/modules/profile/complete_your_profile/select_preferences/select_preference_store.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/app_colors.dart';

class PreferenceChips extends StatelessWidget {
  const PreferenceChips({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.provide<SelectPreferenceStore>();
    return Observer(
      builder: (context) {
        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: store.preferenceList
              .map(
                (e) => InkWell(
                  onTap: () => store.selectPreference(
                    store.preferenceList.indexOf(
                      e,
                    ),
                  ),
                  highlightColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                  splashColor: Colors.transparent,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          32,
                        ),
                      ),
                      color: e.value.isSelected
                          ? context.themeColor.primaryColor
                          : AppColors.whiteColor,
                      border: Border.all(
                        color: context.themeColor.preferenceChipBorderColor ??
                            AppColors.preferenceChipBorderColor,
                      ),
                    ),
                    child: Text(
                      e.value.preference,
                      style: context.textStyleTheme.bodyMediumRegular?.copyWith(
                        color: e.value.isSelected
                            ? AppColors.whiteColor
                            : AppColors.blackColor,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
