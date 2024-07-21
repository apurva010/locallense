import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/modules/home/profile/edit_page_view.dart';
import 'package:locallense/modules/profile/complete_your_profile/select_preferences/preference_chips.dart';
import 'package:locallense/modules/profile/complete_your_profile/select_preferences/select_preference_store.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/utils/helpers/helpers.dart';

class EditPrefScreen extends StatelessObserverWidget {
  const EditPrefScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.provide<SelectPreferenceStore>();
    return EditPageView(
      title: 'My Preferences',
      isLoading: store.postNetworkState.isLoading,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Update your preferences",
            style: context.textStyleTheme.bodyXLargeSemiBold,
          ),
          Text(
            "Personalize your experience by updating your preferences.",
            style: context.textStyleTheme.bodyMediumRegular,
          ),
          const SizedBox(
            height: 20,
          ),
          const PreferenceChips(),
        ],
      ),
      onUpdate: () async {
        await store.postSelectPref();
        await showSuccessDialog();
        navigation.pop();
      },
    );
  }
}
