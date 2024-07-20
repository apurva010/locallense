import 'dart:async';

import 'package:locallense/app_global_variables.dart';
import 'package:locallense/utils/network/network_state_store.dart';
import 'package:mobx/mobx.dart';

part 'splash_screen_store.g.dart';

class SplashScreenStore = _SplashScreenStore with _$SplashScreenStore;

abstract class _SplashScreenStore extends NetworkStateStore with Store {
  _SplashScreenStore() {
    hasInternet = networkService.hasConnection;
    connectivitySubscription = networkService.connectionChange.listen((event) {
      hasInternet = bool.tryParse(event.toString()) ?? false;
    });
  }

  late StreamSubscription<dynamic> connectivitySubscription;

  @observable
  bool hasInternet = false;

  void cancelSubscription() {
    connectivitySubscription.cancel();
  }
}
