import 'package:flutter/material.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:screwdriver/screwdriver.dart';

class LLNavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (appSession.isInsideApp) {
      navigation.routeStack.add(route);
    }
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (appSession.isInsideApp) {
      navigation.routeStack.removeLast();
    }
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (appSession.isInsideApp && navigation.routeStack.isNotNullOrEmpty) {
      navigation.routeStack.removeLast();
    }
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (appSession.isInsideApp) {
      navigation.routeStack
        ..removeLast()
        ..add(newRoute!);
    }

    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
