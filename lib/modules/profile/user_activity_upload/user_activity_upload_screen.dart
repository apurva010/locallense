import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/gen/assets.gen.dart';
import 'package:locallense/modules/profile/complete_your_profile/widgets/process_header_widget.dart';
import 'package:locallense/modules/profile/user_activity_upload/steps_widget.dart';
import 'package:locallense/modules/profile/user_activity_upload/user_activity_upload_store.dart';
import 'package:locallense/utils/common_widgets/ll_empty_list_placeholder.dart';
import 'package:locallense/utils/common_widgets/ll_scaffold.dart';
import 'package:locallense/utils/common_widgets/local_lens_button.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/app_colors.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:url_launcher/url_launcher.dart';

class UserActivityUploadScreen extends StatefulWidget {
  const UserActivityUploadScreen({super.key});

  @override
  State<UserActivityUploadScreen> createState() =>
      _UserActivityUploadScreenState();
}

class _UserActivityUploadScreenState extends State<UserActivityUploadScreen> {
  late final store = provide<UserActivityUploadStore>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => showInstructionDialog(),
    );
    super.initState();
  }

  void showInstructionDialog() {
    showDialog<void>(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.78,
            padding: const EdgeInsets.only(
              top: 24,
              left: 24,
              right: 24,
            ),
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'How to download',
                        style: navigation.context.textStyleTheme.headLine6
                            ?.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: navigation.pop,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(
                              0XFFE6E8EC,
                            ),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              12,
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.all(
                          12,
                        ),
                        child: Assets.vectors.cross.svg(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Text(
                        "Below, I've outlined how users can download their activity file.",
                        style: context.textStyleTheme.bodyMediumRegular,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      StepsWidget(
                        stepWidget: RichText(
                          text: TextSpan(
                            text: 'Navigate to ',
                            style: context.textStyleTheme.bodyMediumRegular,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Google Takeout',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = launchGoogleTakeout,
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const StepsWidget(
                        step:
                            'Select the Google account from which you want to export activity.',
                      ),
                      const StepsWidget(
                        step: 'Click on Create a new Export Session.',
                      ),
                      const StepsWidget(
                        step: 'Click Deselect All to clear all selections.',
                      ),
                      const StepsWidget(
                        step:
                            'Locate the “My Activity” card and click on “All activity data included” to open the popup.',
                      ),
                      const StepsWidget(
                        step: 'In the popup, select only Maps, then click OK.',
                      ),
                      const StepsWidget(
                        step: 'Click Next Step.',
                      ),
                      const StepsWidget(
                        step:
                            'Choose to export the file via Email. You will receive an email containing a ZIP file of your activity data.',
                      ),
                      const StepsWidget(
                        step:
                            'Unzip the downloaded folder and navigate to My Activity -> Maps.',
                      ),
                      const StepsWidget(
                        step:
                            'Locate the MyActivity.html file that you need to upload.',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> launchGoogleTakeout() async {
    try {
      const url = 'https://takeout.google.com/settings/takeout';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(
          Uri.parse(url),
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return LLScaffold(
      appBarTitle: str.completeProfileTitle,
      backButtonVisibility: false,
      actions: [
        IconButton(
          onPressed: showInstructionDialog,
          icon: const Icon(
            Icons.info_outline,
            color: Colors.black,
          ),
        ),
      ],
      body: Observer(
        builder: (context) {
          return store.screenState.isLoading
              ? LLEmptyListPlaceHolder(
                  state: store.screenState,
                )
              : Column(
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
                          getNote: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: RichText(
                              text: TextSpan(
                                text: 'Note :',
                                style: context.textStyleTheme.bodySmallMedium
                                    ?.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                  color: AppColors.blackColor,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        'Uploaded activity files are used solely '
                                        'to personalize your experience. '
                                        'We do not store or track your data '
                                        'beyond enhancing your preferences.',
                                    style: context
                                        .textStyleTheme.bodyMediumSemiBold
                                        ?.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.4,
                                      color: AppColors.neutrals4,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          svgPlaceholder: store.fileState.isSuccessful
                              ? Assets.vectors.fileAdded.path
                              : Assets.vectors.userActivityUpload.path,
                          errorTitle: str.uploadActivityFileTxt,
                          emptyTitle:
                              'We have received your activities and can start '
                              "processing it. Click 'Continue' to process",
                          buttonIcon: const Icon(Icons.add),
                          buttonText: store.fileState.isSuccessful
                              ? 'Change file'
                              : 'Upload File now',
                          buttonType: ButtonType.secondaryButton,
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          imagePadding:
                              const EdgeInsets.symmetric(horizontal: 64),
                          onButtonClick: store.uploadUserActivity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Observer(
                        builder: (context) => LocalLensButton(
                          btnText: str.continueTxt,
                          isLoading: store.apiState.isLoading,
                          onTap: store.continueToNextScreen,
                        ),
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
                );
        },
      ),
    );
  }
}
