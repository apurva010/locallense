import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/modules/home/home_screen_store.dart';
import 'package:locallense/modules/home/utils/home_utils.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/utils/ll_svg_picture.dart';
import 'package:locallense/values/app_colors.dart';
import 'package:locallense/values/constants.dart';

class HomeBottomNavBar extends StatelessObserverWidget {
  const HomeBottomNavBar({
    this.showText = false,
    super.key,
  });

  final bool showText;

  @override
  Widget build(BuildContext context) {
    final store = context.provide<HomeScreenStore>();
    final selectedTab = store.selectedTab;
    final selectedTabIndex = store.selectedTabIndex;
    return BottomNavigationBar(
      items: _createTiles(selectedTab, context),
      onTap: (index) {
        /// Below we are managing if user click the same tabs while the
        /// tab is selected then we will redirect user back to the first
        /// page of that particular tab navigation stack.
        if (selectedTabIndex == index) {
          final currentContext = homeKeyManager.selectedTabKey.currentContext;
          if (currentContext != null) {
            Navigator.of(currentContext).popUntil((route) => route.isFirst);
          }
        }
        store.selectTab(HomeTabs.values[index]);
        FocusManager.instance.primaryFocus?.unfocus();
      },
      backgroundColor: Colors.transparent,
      selectedItemColor: AppColors.primaryColor2,
      unselectedItemColor: AppColors.whiteColor,
      selectedFontSize: 0,
      unselectedFontSize: 0,
      type: BottomNavigationBarType.fixed,
      enableFeedback: false,
    );
  }

  List<BottomNavigationBarItem> _createTiles(
    HomeTabs selectedTab,
    BuildContext context,
  ) {
    final tiles = <BottomNavigationBarItem>[];
    const homeTabs = HomeTabs.values;
    for (var i = 0; i < homeTabs.length; i++) {
      final tab = homeTabs[i];
      tiles.add(
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 72,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: LLSvgPicture(
                tab.icon,
                color: selectedTab == tab
                    ? AppColors.neutrals3
                    : AppColors.neutrals4,
                height: 28,
                width: 28,
              ),
            ),
          ),
          label: Constants.empty,
        ),
      );
    }
    return tiles;
  }
}
