import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../gen/assets.gen.dart';
import '../../utils/extensions.dart';
import '../../values/app_theme_store.dart';
import '../../values/strings.dart';
import 'splash_screen_store.dart';

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

  Future<void> navigationPage() async =>
      context.pushReplacementNamed<void, void>(AppRoutes.txtAfterSplash);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Assets.images.splash.image(
        height: context.screenSize.height,
        width: context.screenSize.width,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SplashScreenStore splashStore;

  @override
  void initState() {
    super.initState();
    splashStore = provide<SplashScreenStore>();
  }

  @override
  void dispose() {
    splashStore.cancelSubscription();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeStore = context.provide<AppThemeStore>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          Observer(
            builder: (context) {
              return Switch.adaptive(
                value: themeStore.themeMode == ThemeMode.dark,
                onChanged: (value) => themeStore.changeTheme(isDarkMode: value),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (_) => Text(
                'Is internet active : ${splashStore.hasInternet}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
