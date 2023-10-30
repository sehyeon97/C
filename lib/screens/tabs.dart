import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:meals/screens/categories.dart';
import 'package:meals/screens/daily_intake.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _setScreen(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String appBarTitle = 'Campus Food';
    Widget activePage = const CategoriesScreen();

    if (_selectedPageIndex == 1) {
      activePage = const DailyIntake();
      appBarTitle = 'Today\'s Intake';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 235, 120, 168),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _setScreen,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.fromString('store-clock-outline'),
            ),
            label: 'Meals',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.fromString('nutrition'),
            ),
            label: 'Daily Intake',
          ),
        ],
      ),
      body: activePage,
      backgroundColor: const Color.fromARGB(255, 141, 208, 235),
    );
  }
}
