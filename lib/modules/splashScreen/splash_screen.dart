import 'dart:async';

import 'package:flutter/material.dart';
import 'package:locallense/apibase/repository/auth_repository.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/services/secure_storage.dart';
import 'package:locallense/services/shared_prefs.dart';
import 'package:locallense/values/enumeration.dart';

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
    final currentUser = await AuthRepository.instance.googleSignIn.isSignedIn();
    final isLoggedIn = await SharedPrefs.getSharedProperty(
      keyEnum: SharedPrefsKeys.isLoggedIn,
    ) as bool?;
    if (currentUser && (isLoggedIn ?? false)) {
      await navigation.pushNamedAndRemoveUntil(
        AppRoutes.homeScreen,
        (route) => false,
      );
    } else {
      await SecureStorage.deleteAll();
      await SharedPrefs.clearPreferences();
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
      child: Assets.images.icon.image(
        height: context.screenSize.height,
        width: context.screenSize.width,
      ),
    );
  }
}
