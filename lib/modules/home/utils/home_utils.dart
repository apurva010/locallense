import 'package:flutter/material.dart';
import 'package:locallense/gen/assets.gen.dart';

class HomeNavigatorKeyManager {
  HomeNavigatorKeyManager._();

  static HomeNavigatorKeyManager instance = HomeNavigatorKeyManager._();

  HomeTabs selectedTab = HomeTabs.home;

  final keys = <GlobalKey<NavigatorState>>[
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  GlobalKey<NavigatorState> get selectedTabKey {
    switch (selectedTab) {
      case HomeTabs.home:
        return keys[0];
      case HomeTabs.discover:
        return keys[1];
      case HomeTabs.profile:
        return keys[2];
    }
  }
}

enum HomeTabs {
  home,
  discover,
  profile;

  String get icon {
    switch (this) {
      case HomeTabs.home:
        return Assets.vectors.home.path;
      case HomeTabs.discover:
        return Assets.vectors.location.path;
      case HomeTabs.profile:
        return Assets.vectors.profile.path;
    }
  }
}
