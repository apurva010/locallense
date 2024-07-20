import 'package:flutter/material.dart';
import 'package:locallense/modules/profile/complete_your_profile/basic_details_store.dart';
import 'package:locallense/modules/profile/complete_your_profile/widgets/process_header_widget.dart';
import 'package:locallense/modules/profile/complete_your_profile/widgets/profile_section.dart';
import 'package:locallense/utils/common_widgets/local_lens_button.dart';
import 'package:locallense/utils/extensions.dart';

class BasicDetailsScreen extends StatelessWidget {
  const BasicDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.provide<BasicDetailsStore>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 44,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 36.5,
                ),
                child: Center(
                  child: Text(
                    'Complete your profile',
                    style: context.textStyleTheme.bodyXLargeSemiBold,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const ProcessHeaderWidget(
                title: 'Basic details',
                step: 1,
              ),
              const SizedBox(
                height: 24,
              ),
              const ProfileSection(),
              const SizedBox(
                height: 20,
              ),
              LocalLensButton(
                isLoading: store.networkState.isLoading,
                onTap: store.nextPage,
                btnText: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
