// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../shared/componente.dart';

import 'p_dhelp.dart';
import 'p_dmap.dart';
import 'p_dnotifications.dart';
import 'p_profile.dart';
import 'p_dsearch.dart';

class p_dbox extends StatefulWidget {
  const p_dbox({super.key});

  @override
  _p_dboxState createState() => _p_dboxState();
}

class _p_dboxState extends State<p_dbox> {
  int _selectedIndex = 0;
  final List<Widget> _pages = <Widget>[
    p_dsearch(
      appointments: const [],
    ),
    const p_dmap(),
    const p_profile(),
    const p_dnotifications(),
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
            backgroundColor: Colors.white30,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white30,
            icon: Icon(Icons.location_on),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Prfile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.help_outline,
            ),
            label: 'Help',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: defultColor,
        selectedItemColor: defultColor2,
        unselectedItemColor: Colors.white30,
        onTap: _onItemTapped,
      ),
    );
  }
}
