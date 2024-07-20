import 'package:flutter/material.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/modules/profile/complete_your_profile/select_preferences/preference_chips.dart';
import 'package:locallense/modules/profile/complete_your_profile/widgets/process_header_widget.dart';
import 'package:locallense/utils/common_widgets/ll_scaffold.dart';
import 'package:locallense/utils/common_widgets/local_lens_button.dart';
import 'package:locallense/utils/extensions.dart';

class SelectYourPreference extends StatelessWidget {
  const SelectYourPreference({super.key});

  @override
  Widget build(BuildContext context) {
    return LLScaffold(
      appBarTitle: str.completeYourProfile,
      backButtonVisibility: false,
      automaticallyImplyLeading: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            ProcessHeaderWidget(
              title: str.selectYourPreferences,
              step: 3,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              str.preferences,
              style: context.textStyleTheme.headLine5,
            ),
            const SizedBox(
              height: 16,
            ),
            const PreferenceChips(),
            const Spacer(),
            LocalLensButton(
              onTap: () {},
              btnText: str.complete,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
