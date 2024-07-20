import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/generated/l10n.dart';
import 'package:locallense/modules/splashScreen/splash_screen_store.dart';
import 'package:locallense/utils/navigation/ll_navigation_observer.dart';

import 'modules/splashScreen/splash_screen.dart';
import 'utils/extensions.dart';
import 'utils/navigation/routes.dart';
import 'values/app_theme/app_theme.dart';
import 'values/app_theme/app_theme_store.dart';

class LocalLensApp extends StatefulWidget {
  const LocalLensApp({super.key});

  @override
  State<LocalLensApp> createState() => _LocalLensAppState();
}

class _LocalLensAppState extends State<LocalLensApp> {
  @override
  void initState() {
    networkService.initialize();
    authRepository.initGoogleSignIn();
    apiRepository.initialise();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeStore = context.provide<AppThemeStore>();
    return Observer(
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeStore.themeMode,
          builder: BotToastInit(),
          navigatorObservers: [
            LLNavigationObserver(),
            BotToastNavigatorObserver(),
          ],
          supportedLocales: Str.delegate.supportedLocales,
          localizationsDelegates: const [
            Str.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          navigatorKey: navigation.navigatorKey,
          onGenerateRoute: (settings) => Routes.generateRoute(
            settings,
            const SplashScreen().withProvider(SplashScreenStore()),
          ),
        );
      },
    );
  }
}
