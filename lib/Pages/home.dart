// ignore_for_file: prefer_const_constructors

// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:xwalli/Pages/explorepage.dart';
import 'package:xwalli/Pages/search.dart';
import 'package:xwalli/Pages/settingspage.dart';
import 'package:xwalli/constants.dart';

import 'homepage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    ExplorePage(),// Using const for ExplorePage
    SettingsPage(), // Using const for SettingsPage
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RealWhite,
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: RealWhite,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: RealWhite.withOpacity(.1),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Mint,
              hoverColor: Mint,
              gap: 8,
              activeColor: Land,
              iconSize: 22,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 500),
              tabBackgroundColor: Mint,
              color: Hover,
              tabs: [
                GButton(
                  icon: Iconsax.home_2,
                  text: 'Release',
                ),
                GButton(
                  icon: Iconsax.search_favorite,
                  text: 'Search',
                ),
                GButton(
                  icon: Iconsax.image,
               text: 'Collections',
                ),
                GButton(
                  icon: Iconsax.crown,
                  text: 'Preferences',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
