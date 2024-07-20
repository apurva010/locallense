import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locallense/app_global_variables.dart';

import 'modules/splashScreen/splash_screen.dart';
import 'routes.dart';
import 'utils/extensions.dart';
import 'values/app_theme/app_theme.dart';
import 'values/app_theme/app_theme_store.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

NavigatorState get navigator => navigatorKey.currentState!;

class LocalLensApp extends StatefulWidget {
  const LocalLensApp({super.key});

  @override
  State<LocalLensApp> createState() => _LocalLensAppState();
}

class _LocalLensAppState extends State<LocalLensApp> {
  @override
  void initState() {
    networkService.initialize();
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
          home: const SplashScreen(),
          onGenerateRoute: Routes.generateRoute,
          navigatorKey: navigatorKey,
        );
      },
    );
  }
}
