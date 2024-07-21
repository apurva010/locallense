import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:locallense/apibase/repository/api_repository.dart';
import 'package:locallense/apibase/repository/auth_repository.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/gen/assets.gen.dart';
import 'package:locallense/modules/home/profile/profile_screen_store.dart';
import 'package:locallense/services/secure_storage.dart';
import 'package:locallense/services/shared_prefs.dart';
import 'package:locallense/utils/common_widgets/dialog/ll_dialog.dart';
import 'package:locallense/utils/common_widgets/ll_scaffold.dart';
import 'package:locallense/utils/common_widgets/local_lens_button.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/utils/helpers/helpers.dart';
import 'package:locallense/values/app_colors.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:locallense/values/strings.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<ProfileScreenStore>();
    return LLScaffold(
      appBarTitle: 'My Account',
      scaffoldPadding: const EdgeInsets.symmetric(horizontal: 24),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Center(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            70,
                          ),
                        ),
                        child: Observer(
                          builder: (context) {
                            return store.userDataRes?.profileUrl != null
                                ? CachedNetworkImage(
                                    imageUrl: store.userDataRes!.profileUrl,
                                    fit: BoxFit.fill,
                                    errorWidget: (context, url, error) =>
                                        Assets.images.user.image(),
                                  )
                                : Assets.images.user.image();
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Observer(
                    builder: (context) {
                      return Text(
                        '${store.userDataRes?.firstName} '
                        '${store.userDataRes?.lastName}',
                        style:
                            context.textStyleTheme.bodyXLargeSemiBold?.copyWith(
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.2,
                        ),
                      );
                    },
                  ),
                  Observer(
                    builder: (context) {
                      return Text(
                        store.userDataRes?.email ?? '',
                        style:
                            context.textStyleTheme.bodyMediumRegular?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: 0.2,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'My Profile',
                      style: context.textStyleTheme.bodyMediumSemiBold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _getListTileWidget(
                    context: context,
                    title: 'General Information',
                    iconPath: Assets.vectors.generalInfoIcon.path,
                    navigationPath: AppRoutes.editProfileScreen,
                  ),
                  const SizedBox(height: 16),
                  _getListTileWidget(
                    context: context,
                    title: 'My Preferences',
                    iconPath: Assets.vectors.myPrefsIcon.path,
                    navigationPath: AppRoutes.editProfileScreen,
                  ),
                  const SizedBox(height: 16),
                  _getListTileWidget(
                    context: context,
                    title: 'PG Questionnaire',
                    iconPath: Assets.vectors.pgPrefIcon.path,
                    navigationPath: AppRoutes.editProfileScreen,
                  ),
                  const SizedBox(height: 16),
                  _getListTileWidget(
                    context: context,
                    title: 'Hospital Questionnaire',
                    iconPath: Assets.vectors.hospitalPrefIcon.path,
                    navigationPath: AppRoutes.editProfileScreen,
                  ),
                  const SizedBox(height: 16),
                  _getListTileWidget(
                    context: context,
                    title: 'Restaurant Questionnaire',
                    iconPath: Assets.vectors.restaurnatPrefIcon.path,
                    navigationPath: AppRoutes.editProfileScreen,
                  ),
                  const SizedBox(height: 16),
                  _getListTileWidget(
                    context: context,
                    title: 'Tourist Questionnaire',
                    iconPath: Assets.vectors.touriestPrefIcon.path,
                    navigationPath: AppRoutes.editProfileScreen,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          LocalLensButton(
            onTap: () {
              LLDialog(
                title: 'Sign Out',
                msg: 'Are you sure you want to sign out?',
                primaryButton: LocalLensButton(
                  onTap: () async {
                    await AuthRepository.instance.logOut();
                  },
                  btnText: 'LogOut',
                ),
                secondaryButton: LocalLensButton(
                  onTap: navigation.pop,
                  btnText: 'Cancel',
                  buttonType: ButtonType.secondaryButton,
                ),
              ).show();
            },
            buttonColor: AppColors.redColor.withOpacity(0.2),
            borderRadius: 16,
            btnText: 'Sign out',
            textStyle: context.textStyleTheme.bodyXLargeSemiBold?.copyWith(
              fontSize: 16,
              letterSpacing: 0.2,
              fontWeight: FontWeight.w600,
              color: AppColors.redColor,
            ),
          ),
          InkWell(
            onTap: () {
              LLDialog(
                title: 'Delete Account',
                msg: 'Are you sure you want to delete your account?',
                primaryButton: LocalLensButton(
                  onTap: () async {
                    try {
                      await APIRepository.instance.deleteUserData().getResult();
                      await SecureStorage.deleteAll();
                      await SharedPrefs.clearPreferences();
                      await AuthRepository.instance.logOut();
                    } catch (e) {
                      showErrorToast(
                        'Something went wrong while deleting account',
                      );
                    }
                  },
                  btnText: 'Delete',
                ),
                secondaryButton: LocalLensButton(
                  onTap: navigation.pop,
                  btnText: 'Cancel',
                  buttonType: ButtonType.secondaryButton,
                ),
              ).show();
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Delete my account',
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
      ),
    );
  }

  Widget _getListTileWidget({
    required String iconPath,
    required String title,
    required String navigationPath,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () async {
        await navigation.pushNamed(navigationPath);
        if (navigationPath == AppRoutes.editProfileScreen && context.mounted) {
          await context.read<ProfileScreenStore>().initState();
        }
      },
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: context.themeColor.primaryColor?.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              iconPath,
              width: 20,
              height: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: context.textStyleTheme.bodyMediumSemiBold?.copyWith(
                color: AppColors.neutrals3,
              ),
            ),
          ),
          SvgPicture.asset(
            Assets.vectors.sideArrowIcon.path,
            width: 20,
            height: 20,
          ),
        ],
      ),
    );
  }
}

// LLDialog(
//   header: LLSvgPicture(
//     Assets.vectors.chekMarkFilled.path,
//     size: 42,
//   ),
//   title: 'Successfully Updated',
//   msg:
//       'Your information about the preferences has been successfully updated',
// ).show();
//
// showSuccessToast("Single line message placeholder.");
