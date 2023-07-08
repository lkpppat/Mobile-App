import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mypets/database/database_helper.dart';
import 'package:mypets/pages/page1_mypets.dart';
import 'package:mypets/pages/page2_mystory.dart';
import 'package:mypets/pages/page3_profile.dart';



class CustomNavBar extends StatefulWidget {
  CustomNavBar({Key? key, required this.dbHelper}) : super(key: key);
  DatabaseHelper dbHelper;

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  final List<Widget> screens = [
    PetsScreen(
      dbHelper: DatabaseHelper(),
    ),
    HomePage2(),
    HomePage4(),
    
  ];


  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: screens,
        index: _selectedIndex,
      ),
      bottomNavigationBar: GNav(
        backgroundColor: Color.fromARGB(255, 231, 137, 83),
        rippleColor: Color.fromARGB(255, 255, 255, 255),
        hoverColor: Color.fromARGB(255, 231, 137, 83),
        gap: 8,
        activeColor: Color.fromARGB(255, 255, 255, 255),
        iconSize: 35,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        duration: Duration(milliseconds: 400),
        tabBackgroundColor: Color.fromARGB(255, 233, 157, 113),
        color: Color.fromARGB(255, 255, 255, 255),
        tabs: [
          GButton(
            icon: Icons.pets,
            text: 'My pets',
          ),
          GButton(
            icon: Icons.home,
            text: 'My Home',
          ),
           GButton(
            icon: Icons.people,
            text: 'My Profile',
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}