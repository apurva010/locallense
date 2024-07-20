import 'package:flutter/material.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/modules/home/discover/discover_screen.dart';
import 'package:locallense/modules/home/map/map_screen.dart';
import 'package:locallense/modules/home/utils/home_navigator_page.dart';
import 'package:locallense/modules/home/utils/home_utils.dart';
import 'package:mobx/mobx.dart';

import 'profile/profile_screen.dart';

part 'home_screen_store.g.dart';

class HomeScreenStore = _HomeScreenStore with _$HomeScreenStore;

abstract class _HomeScreenStore with Store {
  _HomeScreenStore() {
    _initScreens();
  }

  List<Widget> screens = [];

  @observable
  HomeTabs selectedTab = HomeTabs.home;

  @computed
  int get selectedTabIndex => HomeTabs.values.indexOf(selectedTab);

  void _initScreens() {
    screens = [
      HomeNavigatorPage(
        navigatorKey: homeKeyManager.keys[0],
        child: const MapScreen(),
      ),
      HomeNavigatorPage(
        navigatorKey: homeKeyManager.keys[1],
        child: const DiscoverScreen(),
      ),
      HomeNavigatorPage(
        navigatorKey: homeKeyManager.keys[2],
        child: const ProfileScreen(),
      ),
    ];
  }

  @action
  void selectTab(HomeTabs tab, {bool clearStack = false}) {
    if (clearStack) {
      final currentContext =
          homeKeyManager.keys[HomeTabs.values.indexOf(tab)].currentContext;
      if (currentContext != null) {
        Navigator.of(currentContext).popUntil((route) => route.isFirst);
      }
    }
    selectedTab = tab;
    homeKeyManager.selectedTab = tab;
  }

  // TODO(Happy): Get User Data
  // Future<void> getUserDetails() async {
  //   try {
  //     await authRepository.getUserProfile();
  //   } catch (e, st) {
  //     debugPrint(e.toString());
  //     debugPrintStack(stackTrace: st);
  //   }
  // }
}
