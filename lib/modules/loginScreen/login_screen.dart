import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/gen/assets.gen.dart';
import 'package:locallense/modules/loginScreen/login_screen_store.dart';
import 'package:locallense/utils/common_widgets/local_lens_button.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/app_colors.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<LoginScreenStore>();
    final textTheme = context.textStyleTheme;
    final colorTheme = context.themeColor;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: SvgPicture.asset(
                          Assets.vectors.loginScreen.path,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        str.signInToYourAccount,
                        style: textTheme.headLine4?.copyWith(
                          color: colorTheme.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          str.loginSubtitleText,
                          style: textTheme.bodyMediumRegular,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Observer(
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: LocalLensButton(
                              onTap: store.loginWithGoogleOnPress,
                              buttonType: ButtonType.secondaryButton,
                              borderColor: colorTheme.naturalBorderColor,
                              showBorder: true,
                              loaderColor: colorTheme.primaryColor,
                              isLoading: store.isGoogleLoginLoading,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    Assets.vectors.googleIcon.path,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    str.continueWithGoogle,
                                    style: textTheme.bodyXLargeSemiBold,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: RichText(
                textAlign: TextAlign.center,
                strutStyle: const StrutStyle(
                  height: 1.2,
                ),
                text: TextSpan(
                  text: str.byLoggingInOrRegisteringYouAgreeToOur,
                  style: textTheme.bodySmallRegular?.copyWith(
                    color: colorTheme.naturalBorderColor,
                  ),
                  children: [
                    const WidgetSpan(child: SizedBox(width: 4)),
                    TextSpan(
                      text: str.termsConditions,
                      style: textTheme.bodySmallMedium?.copyWith(
                        color: colorTheme.primaryColor,
                      ),
                    ),
                    const WidgetSpan(child: SizedBox(width: 4)),
                    TextSpan(
                      text: str.andAcknowledgeOur,
                      style: textTheme.bodySmallRegular?.copyWith(
                        color: colorTheme.naturalBorderColor,
                      ),
                    ),
                    const WidgetSpan(child: SizedBox(width: 4)),
                    TextSpan(
                      text: str.privacyPolicy,
                      style: textTheme.bodySmallMedium?.copyWith(
                        color: colorTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
