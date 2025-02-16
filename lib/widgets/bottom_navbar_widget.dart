import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_countries/providers/bottom_navbar_provider.dart';

import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: switch (context.watch<BottomNavbarProvider>().currentIndex) {
          0 => HomeScreen(),
          1 => SearchScreen(),
          2 => ProfileScreen(),
          _ => HomeScreen(), // default case
        },
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: context.watch<BottomNavbarProvider>().currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          onTap: (value) => context.read<BottomNavbarProvider>().changeIndex(value),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              tooltip: 'Home',
              activeIcon: Icon(Icons.home_rounded),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Search',
              tooltip: 'Search',
              activeIcon: Icon(Icons.search_rounded),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Account',
              tooltip: 'Account',
              activeIcon: Icon(Icons.person_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
