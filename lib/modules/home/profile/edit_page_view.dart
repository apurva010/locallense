import 'package:flutter/material.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/utils/common_widgets/ll_scaffold.dart';
import 'package:locallense/utils/common_widgets/local_lens_button.dart';
import 'package:locallense/values/enumeration.dart';

class EditPageView extends StatelessWidget {
  const EditPageView({
    required this.title,
    required this.body,
    required this.onUpdate,
    super.key,
    this.isLoading = false,
  });

  final String title;
  final Widget body;
  final Future<void> Function() onUpdate;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return LLScaffold(
      appBarTitle: 'My Preferences',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          children: [
            Expanded(child: body),
            LocalLensButton(
              onTap: onUpdate,
              isLoading: isLoading,
              btnText: 'Update Details',
            ),
            const SizedBox(
              height: 8,
            ),
            LocalLensButton(
              onTap: navigation.pop,
              buttonType: ButtonType.textOnly,
              btnText: 'Cancel',
            ),
          ],
        ),
      ),
    );
  }
}
