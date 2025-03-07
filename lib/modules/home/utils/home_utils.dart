import 'package:flutter/material.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/gen/assets.gen.dart';

class HomeNavigatorKeyManager {
  HomeNavigatorKeyManager._();

  static HomeNavigatorKeyManager instance = HomeNavigatorKeyManager._();

  HomeTabs selectedTab = HomeTabs.home;

  final keys = <GlobalKey<NavigatorState>>[
    GlobalKey(),
    GlobalKey(),
  ];

  GlobalKey<NavigatorState> get selectedTabKey {
    switch (selectedTab) {
      case HomeTabs.home:
        return keys[0];
      case HomeTabs.profile:
        return keys[1];
    }
  }
}

enum HomeTabs {
  home,
  profile;

  String icon({required bool isFilled}) {
    switch (this) {
      case HomeTabs.home:
        return isFilled
            ? Assets.vectors.homeFilled.path
            : Assets.vectors.home.path;
      case HomeTabs.profile:
        return isFilled
            ? Assets.vectors.profileFilled.path
            : Assets.vectors.profile.path;
    }
  }

  String get title {
    switch (this) {
      case HomeTabs.home:
        return str.home;
      case HomeTabs.profile:
        return str.profile;
    }
  }
}
