import 'package:flutter/material.dart';
import 'package:locallense/modules/home/utils/home_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
