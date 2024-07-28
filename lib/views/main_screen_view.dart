import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:joke_box/views/home_screen_view.dart';
import 'package:joke_box/views/preferences_screen_view.dart';
import 'package:joke_box/views/saved_jokes_screen_view.dart';

class MainScreen extends StatefulWidget
{
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
{
  int _selectedIndex = 0;

  final List<Widget> _navBarScreens =
  [
    HomeScreen(),

    SavedJokesScreen(),

    PreferencesScreen(),
  ];

  void _onNavBarItemTapped(int index)
  {
    setState(()
    {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,

        title: (_selectedIndex == 0)? Text('app_bar_home'.tr()) :

        (_selectedIndex == 1)? Text('app_bar_favorites'.tr()) :

        Text('app_bar_preferences'.tr()),
      ),

      body: _navBarScreens[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        items:
        [
          BottomNavigationBarItem(
            icon: const Icon(Ionicons.home_outline),
            label: 'home_nav_bar_label'.tr(),
          ),

          BottomNavigationBarItem(
            icon: const Icon(Ionicons.bookmarks_outline),
            label: 'saved_jokes_nav_bar_label'.tr(),
          ),

          BottomNavigationBarItem(
            icon: const Icon(Ionicons.settings_outline),
            label: 'preferences_nav_bar_label'.tr(),
          ),
        ],

        currentIndex: _selectedIndex,

        onTap: _onNavBarItemTapped,
      ),
    );
  }
}
