import 'package:flutter/material.dart';
import 'package:locallense/app_global_variables.dart';

class LLNavigation {
  LLNavigation._();

  static final LLNavigation instance = LLNavigation._();

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  final List<Route<dynamic>> routeStack = <Route<dynamic>>[];

  bool _rootNavigator = true;

  GlobalKey<NavigatorState> get navigatorKey {
    return _navigatorKey;
  }

  BuildContext get context {
    return _navigatorKey.currentState!.context;
  }

  BuildContext get getBottomNavigatorContext {
    return homeKeyManager.selectedTabKey.currentState!.context;
  }

  NavigatorState get _commonNavigator {
    if (appSession.isInsideApp && routeStack.isEmpty) {
      if (_rootNavigator) {
        _rootNavigator = false;
        return _navigatorKey.currentState!;
      } else {
        if (homeKeyManager.selectedTabKey.currentState != null) {
          return homeKeyManager.selectedTabKey.currentState!;
        } else {
          _rootNavigator = false;
          return _navigatorKey.currentState!;
        }
      }
    } else {
      _rootNavigator = false;
      return _navigatorKey.currentState!;
    }
  }

  bool get canPop => _commonNavigator.canPop();

  void enableRootNavigator() => _rootNavigator = true;

  void disableRootNavigator() => _rootNavigator = false;

  void pop<T extends Object?>([T? result]) {
    _commonNavigator.pop(result);
  }

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) async {
    return _commonNavigator.pushNamed(routeName, arguments: arguments);
  }

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) async {
    return _commonNavigator.pushReplacementNamed(
      routeName,
      arguments: arguments,
      result: result,
    );
  }

  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) async {
    return _commonNavigator.popAndPushNamed(
      routeName,
      arguments: arguments,
      result: result,
    );
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) async {
    return _commonNavigator.pushNamedAndRemoveUntil(
      newRouteName,
      predicate,
      arguments: arguments,
    );
  }

  void popUntil<T extends Object?>(RoutePredicate predicate) {
    return _commonNavigator.popUntil(predicate);
  }
}
