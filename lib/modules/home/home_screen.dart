import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/modules/home/home_screen_store.dart';
import 'package:locallense/modules/home/utils/home_bottom_nav_bar.dart';
import 'package:locallense/utils/common_widgets/ll_pop_scope.dart';
import 'package:locallense/utils/extensions.dart';

class HomeScreen extends StatefulObserverWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeScreenStore store;

  @override
  void initState() {
    super.initState();
    initHome();
  }

  Future<void> initHome() async {
    apiRepository.hasLogoutActionPerformed = false;
    store = provide<HomeScreenStore>();
    store.selectTab(store.selectedTab);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const HomeBottomNavBar(),
      resizeToAvoidBottomInset: false,
      body: LLPopScope(
        onWillPop: () async {
          final state = homeKeyManager.selectedTabKey.currentState;
          if (state != null) {
            return !await state.maybePop(context);
          }
          return false;
        },
        child: IndexedStack(
          index: store.selectedTabIndex,
          children: store.screens,
        ),
      ),
    );
  }
}
