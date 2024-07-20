import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/services/shared_prefs.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:screwdriver/screwdriver.dart';

import '../../gen/assets.gen.dart';
import '../../utils/extensions.dart';
import '../../values/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  void _loadWidget() {
    // This will remove splash screen after 3 seconds and push next screen.
    Timer(const Duration(seconds: 3), navigationPage);
  }

  Future<void> navigationPage() async {
    final currentUser = GoogleSignIn().currentUser;
    final isLoggedIn = await SharedPrefs.getSharedProperty(
      keyEnum: SharedPrefsKeys.isLoggedIn,
    ) as bool?;
    if (currentUser.isNotNull) {
      if (isLoggedIn ?? false) {
        await navigation.pushNamedAndRemoveUntil(
          AppRoutes.homeScreen,
          (route) => false,
        );
      }
      await authRepository.logOut();
    } else {
      await navigation.pushNamedAndRemoveUntil(
        AppRoutes.loginScreen,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xffF9FAFB),
      child: Assets.icon.icon.image(
        height: context.screenSize.height,
        width: context.screenSize.width,
      ),
    );
  }
}
