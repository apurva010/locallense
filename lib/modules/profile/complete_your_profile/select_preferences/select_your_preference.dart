import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/modules/profile/complete_your_profile/select_preferences/preference_chips.dart';
import 'package:locallense/modules/profile/complete_your_profile/select_preferences/select_preference_store.dart';
import 'package:locallense/modules/profile/complete_your_profile/widgets/process_header_widget.dart';
import 'package:locallense/utils/common_widgets/ll_empty_list_placeholder.dart';
import 'package:locallense/utils/common_widgets/ll_scaffold.dart';
import 'package:locallense/utils/common_widgets/local_lens_button.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/strings.dart';

class SelectYourPreference extends StatelessWidget {
  const SelectYourPreference({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.provide<SelectPreferenceStore>();
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
            Observer(
              builder: (context) => store.fetchNetworkState.isLoading
                  ? LLEmptyListPlaceHolder(state: store.fetchNetworkState)
                  : const PreferenceChips(),
            ),
            const Spacer(),
            Observer(
              builder: (context) {
                return LocalLensButton(
                  onTap: () async {
                    await store.postSelectPref();
                    await navigation.pushReplacementNamed(
                      AppRoutes.selectAccommodationType,
                    );
                  },
                  btnText: str.continueTxt,
                  isLoading: store.postNetworkState.isLoading,
                );
              },
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
