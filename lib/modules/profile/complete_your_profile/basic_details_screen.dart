import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/modules/profile/complete_your_profile/basic_details_store.dart';
import 'package:locallense/modules/profile/complete_your_profile/widgets/process_header_widget.dart';
import 'package:locallense/modules/profile/complete_your_profile/widgets/profile_section.dart';
import 'package:locallense/utils/common_widgets/ll_scaffold.dart';
import 'package:locallense/utils/common_widgets/local_lens_button.dart';
import 'package:locallense/utils/extensions.dart';

class BasicDetailsScreen extends StatelessWidget {
  const BasicDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.provide<BasicDetailsStore>();
    return LLScaffold(
      automaticallyImplyLeading: false,
      backButtonVisibility: false,
      appBarTitle: str.completeProfileTitle,
      body: Observer(
        builder: (context) {
          if (store.networkState.isIdle) {
            return const SizedBox.shrink();
          } else if (store.networkState.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (store.networkState.isFailed) {
            return const Text('Something went wrong');
          }
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              children: [
                const Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        ProcessHeaderWidget(
                          title: 'Basic details',
                          step: 1,
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        ProfileSection(),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Observer(
                  builder: (context) {
                    return LocalLensButton(
                      isLoading: store.buttonLoading.isLoading,
                      onTap: store.nextPage,
                      btnText: 'Continue',
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
