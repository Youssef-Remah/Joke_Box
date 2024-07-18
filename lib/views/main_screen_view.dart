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

        title: (_selectedIndex == 0)? const Text('Home') :

        (_selectedIndex == 1)? const Text('Saved Jokes') :

        const Text('Preferences'),
      ),

      body: _navBarScreens[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        items:
        const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Ionicons.bookmarks_outline),
            label: 'Saved Jokes',
          ),

          BottomNavigationBarItem(
            icon: Icon(Ionicons.settings_outline),
            label: 'Preferences',
          ),
        ],

        currentIndex: _selectedIndex,

        onTap: _onNavBarItemTapped,
      ),
    );
  }
}
