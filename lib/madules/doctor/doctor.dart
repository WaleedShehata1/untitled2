// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../../shared/componente.dart';
import '../p_dhome/p_dhelp.dart';

import 'dprofile.dart';
import 'dmessages.dart';

class doctor extends StatefulWidget {
  const doctor({super.key});
  static const String id = "doctor";
  @override
  State<doctor> createState() => _doctorState();
}

class _doctorState extends State<doctor> {
  int _selectedIndex = 0;
  final List<Widget> _pages = <Widget>[
    const Messages(),
    const profile(),
    const p_dhelp()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.person),
            label: 'Prfile',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.help_outline,
            ),
            label: 'Help',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: defultColor,
        unselectedItemColor: defultColor2,
        onTap: _onItemTapped,
      ),
    );
  }
}
