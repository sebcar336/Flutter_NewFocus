import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:new_focus_/home_folder/home_page.dart';
import 'package:new_focus_/styles/palleta.dart';
import 'package:new_focus_/task_folder/task_page.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const TaskScreen(),
    const HomePage(),
    const TaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: Pallete.customColor1,
        backgroundColor: Pallete.backgroundColor,
        buttonBackgroundColor: Pallete.customColor1,
        height: 52,
        items: const <Widget>[
          Icon(Icons.grid_view_rounded,
              size: 20, color: Pallete.backgroundColor),
          Icon(Icons.access_time, size: 20, color: Pallete.backgroundColor),
          Icon(Icons.bookmarks_outlined,
              size: 20, color: Pallete.backgroundColor),
          Icon(Icons.library_books_outlined,
              size: 20, color: Pallete.backgroundColor),
        ],
        animationDuration: const Duration(milliseconds: 350),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
