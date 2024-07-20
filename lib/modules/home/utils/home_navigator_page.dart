import 'package:flutter/material.dart';
import 'package:locallense/modules/home/home_screen_store.dart';
import 'package:locallense/modules/home/utils/home_utils.dart';
import 'package:locallense/utils/common_widgets/ll_pop_scope.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/utils/navigation/routes.dart';

class HomeNavigatorPage extends StatelessWidget {
  const HomeNavigatorPage({
    required this.navigatorKey,
    required this.child,
    super.key,
  });

  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    final navStore = context.provide<HomeScreenStore>();
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) => Routes.generateRoute(
        settings,
        LLPopScope(
          onWillPop: () async {
            /// This will redirect our user to first tab clicking on back from
            /// any other tabs initial page,
            /// for ex: user is on community screen and clicking on back he
            /// will be redirect to the first tab which is user profile.
            if (navStore.selectedTab != HomeTabs.home) {
              navStore.selectTab(HomeTabs.home);
              return false;
            }
            return true;
          },
          child: child,
        ),
      ),
    );
  }
}
