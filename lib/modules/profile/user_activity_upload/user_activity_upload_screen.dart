import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/gen/assets.gen.dart';
import 'package:locallense/modules/profile/complete_your_profile/widgets/process_header_widget.dart';
import 'package:locallense/modules/profile/user_activity_upload/user_activity_upload_store.dart';
import 'package:locallense/utils/common_widgets/ll_empty_list_placeholder.dart';
import 'package:locallense/utils/common_widgets/ll_scaffold.dart';
import 'package:locallense/utils/common_widgets/local_lens_button.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/enumeration.dart';

class UserActivityUploadScreen extends StatefulWidget {
  const UserActivityUploadScreen({super.key});

  @override
  State<UserActivityUploadScreen> createState() =>
      _UserActivityUploadScreenState();
}

class _UserActivityUploadScreenState extends State<UserActivityUploadScreen> {
  late final store = provide<UserActivityUploadStore>();

  @override
  Widget build(BuildContext context) {
    return LLScaffold(
      appBarTitle: str.completeProfileTitle,
      backButtonVisibility: false,
      body: Column(
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ProcessHeaderWidget(
              title: str.uploadActivityText,
              step: 2,
            ),
          ),
          Expanded(
            child: Observer(
              builder: (context) => LLEmptyListPlaceHolder(
                state: store.fileState,
                svgPlaceholder: Assets.vectors.userActivityUpload.path,
                errorTitle: str.uploadActivityFileTxt,
                emptyTitle: 'We have received your activities and can start '
                    "processing it. Click 'Continue' to process",
                buttonIcon: const Icon(Icons.add),
                buttonText: 'Upload File now',
                buttonType: ButtonType.secondaryButton,
                imagePadding: const EdgeInsets.symmetric(horizontal: 64),
                onButtonClick: store.uploadUserActivity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: LocalLensButton(
              btnText: str.continueTxt,
              onTap: store.continueToNextScreen,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: LocalLensButton(
              btnText: str.skipForNow,
              buttonType: ButtonType.textOnly,
              onTap: store.skipToNextScreen,
            ),
          ),
        ],
      ),
    );
  }
}
