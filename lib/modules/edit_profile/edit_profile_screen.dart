import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locallense/apibase/repository/api_repository.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/model/request/update_user/update_user_info_req.dart';
import 'package:locallense/model/response/user/user_data_res.dart';
import 'package:locallense/modules/profile/complete_your_profile/basic_details_store.dart';
import 'package:locallense/modules/profile/complete_your_profile/widgets/profile_section.dart';
import 'package:locallense/services/shared_prefs.dart';
import 'package:locallense/utils/common_widgets/dialog/ll_dialog.dart';
import 'package:locallense/utils/common_widgets/ll_scaffold.dart';
import 'package:locallense/utils/common_widgets/local_lens_button.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/utils/helpers/helpers.dart';
import 'package:locallense/values/enumeration.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.provide<BasicDetailsStore>();
    return LLScaffold(
      appBarTitle: 'Edit Details',
      scaffoldPadding: const EdgeInsets.symmetric(horizontal: 24),
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
          return Column(
            children: [
              const Expanded(
                  child: SingleChildScrollView(child: ProfileSection())),
              LocalLensButton(
                onTap: () {
                  if (store.firstNameController.text ==
                          store.userDataRes?.firstName &&
                      store.lastNameController.text ==
                          store.userDataRes?.lastName) {
                    return;
                  }

                  LLDialog(
                    title: 'Update Details',
                    msg:
                        'Are you sure you want to update the my profile details ?',
                    primaryButton: LocalLensButton(
                      onTap: () async {
                        try {
                          await APIRepository.instance
                              .updateUserData(
                                UpdateUserInfoReq(
                                  lastName: store.lastNameController.text,
                                  firstName: store.firstNameController.text,
                                ),
                              )
                              .getResult();
                          store.userDataRes = UserDataRes(
                            lastName: store.lastNameController.text,
                            firstName: store.firstNameController.text,
                            email: store.userDataRes!.email,
                            loginProvider: store.userDataRes!.loginProvider,
                            profileUrl: store.userDataRes!.profileUrl,
                          );
                          await SharedPrefs.setSharedProperty(
                            value: jsonEncode(
                              UserDataRes(
                                lastName: store.lastNameController.text,
                                firstName: store.firstNameController.text,
                                email: store.userDataRes!.email,
                                loginProvider: store.userDataRes!.loginProvider,
                                profileUrl: store.userDataRes!.profileUrl,
                              ).toJson(),
                            ),
                            keyEnum: SharedPrefsKeys.userData,
                          );
                          navigation.pop();
                          // TODO(Sahil): Show Success dialog
                        } catch (e) {
                          showErrorToast(
                            'Error occurred while updating profile',
                          );
                        }
                      },
                      btnText: 'Update',
                    ),
                    secondaryButton: LocalLensButton(
                      onTap: navigation.pop,
                      btnText: 'Cancel',
                      buttonType: ButtonType.secondaryButton,
                    ),
                  ).show();
                },
                btnText: 'Update Details',
              ),
              InkWell(
                onTap: navigation.pop,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Cancel',
                    style: context.textStyleTheme.bodyXLargeSemiBold?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          );
        },
      ),
    );
  }
}
