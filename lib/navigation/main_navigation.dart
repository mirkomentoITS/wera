import 'package:flutter/material.dart';

import './bottom_navigator.dart';

import '../features/armadio/pages/armadio_page.dart';
import '../features/capo/pages/capo_page.dart';
import '../features/profile/pages/profile_page.dart';


class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  final pages = const [
    ArmadioPage(),
    CapoPage(),
    ProfilePage(),
  ];

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        IndexedStack(
          index: selectedIndex,
          children: pages,
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: MediaQuery.paddingOf(context).bottom,
          child: BottomNavigator(
            selectedIndex: selectedIndex,
            onTap: changePage,
          ),
        ),
      ],
    );
  }
}