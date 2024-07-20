import 'package:flutter/material.dart';
import 'package:locallense/modules/loginScreen/login_screen.dart';
import 'package:locallense/modules/loginScreen/login_screen_store.dart';

import 'modules/splashScreen/splash_screen.dart';
import 'modules/splashScreen/splash_screen_store.dart';
import 'utils/common_widgets/invalid_route.dart';
import 'utils/extensions.dart';
import 'values/strings.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Route<dynamic> getRoute({
      required Widget widget,
      bool fullscreenDialog = false,
    }) {
      return MaterialPageRoute<void>(
        builder: (context) => widget,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
      );
    }

    switch (settings.name) {
      case AppRoutes.txtAfterSplash:
        return getRoute(
          widget: const HomeScreen().withProvider(SplashScreenStore()),
        );

      case AppRoutes.loginScreen:
        return getRoute(
          widget: const LoginScreen().withProvider(LoginScreenStore()),
        );

      /// An invalid route. User shouldn't see this, it's for debugging purpose
      /// only.
      default:
        return getRoute(widget: const InvalidRoute());
    }
  }
}
