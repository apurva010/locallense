import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locallense/apibase/repository/api_repository.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/gen/assets.gen.dart';
import 'package:locallense/modules/splashScreen/splash_screen_store.dart';
import 'package:locallense/services/secure_storage.dart';
import 'package:locallense/services/shared_prefs.dart';
import 'package:locallense/utils/common_widgets/local_lens_button.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/app_colors.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:locallense/values/strings.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<SplashScreenStore>();
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Assets.images.intro.image(fit: BoxFit.cover),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.blackColor,
                  AppColors.blackColor.withOpacity(0),
                ],
                begin: Alignment.bottomCenter,
                end: const Alignment(0, -0.5),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Perfect Places for You',
                  style: context.textStyleTheme.headLine4?.copyWith(
                    color: AppColors.chipColor,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Find places that fit your lifestyle'
                  ' and preferences perfectly.',
                  textAlign: TextAlign.center,
                  style: context.textStyleTheme.bodyMediumRegular?.copyWith(
                    color: AppColors.chipColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Observer(
                  builder: (context) {
                    return LocalLensButton(
                      onTap: () => navigationPage(store),
                      buttonColor: AppColors.primaryColor,
                      btnText: str.getStarted,
                      isLoading: store.isContinueBtnLoading,
                    );
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> navigationPage(SplashScreenStore store) async {
    store.isContinueBtnLoading = true;

    try {
      final currentUser = await authRepository.googleSignIn.isSignedIn();
      final data = await APIRepository.instance.getUserData().getResult();
      final isLoggedIn = await SharedPrefs.getSharedProperty(
        keyEnum: SharedPrefsKeys.isLoggedIn,
      ) as bool?;
      if (currentUser && (isLoggedIn ?? false)) {
        if (!data.isPreferencesCompleted) {
          await navigation.pushNamedAndRemoveUntil(
            AppRoutes.basicDetailsScreen,
            (route) => false,
          );
        } else {
          await navigation.pushNamedAndRemoveUntil(
            AppRoutes.homeScreen,
            (route) => false,
          );
        }
      } else {
        await SecureStorage.deleteAll();
        await SharedPrefs.clearPreferences();
        await navigation.pushNamedAndRemoveUntil(
          AppRoutes.loginScreen,
          (route) => false,
        );
      }
      store.isContinueBtnLoading = false;
    } catch (e) {
      await SecureStorage.deleteAll();
      await SharedPrefs.clearPreferences();
      store.isContinueBtnLoading = false;
      await navigation.pushNamedAndRemoveUntil(
        AppRoutes.loginScreen,
        (route) => false,
      );
    }
  }
}
