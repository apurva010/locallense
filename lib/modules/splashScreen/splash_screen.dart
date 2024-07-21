import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:locallense/app_global_variables.dart';

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
    Timer(const Duration(seconds: 2), navigationPage);
  }

  Future<void> navigationPage() async {
    await navigation.pushNamedAndRemoveUntil(
      AppRoutes.introScreen,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111827),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: const Color(0xff1CD6E2).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 84, sigmaY: 84),
                  child: const SizedBox(),
                ),
                Positioned.fill(
                  child: Assets.images.splashLogo.image(
                    height: 100,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Local Lens',
              style: context.textStyleTheme.headLine3?.copyWith(
                color: Colors.white,
              ),
            ),
            Text(
              'Your perfect place awaits',
              style: context.textStyleTheme.bodyLargeMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
