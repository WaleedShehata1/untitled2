// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:untitled/madules/p_ahome/p_amap.dart';
import '../p_ahome/p_ahelp.dart';

import '../../shared/componente.dart';
import 'p_ahome.dart';
import 'p_anotifications.dart';
import 'p_aprofile.dart';

class p_abox extends StatefulWidget {
  const p_abox({super.key});

  @override
  _p_aboxState createState() => _p_aboxState();
}

class _p_aboxState extends State<p_abox> {
  int _selectedIndex = 0;
  final List<Widget> _pages = <Widget>[
    const p_ahome(),
    const p_amap(),
    p_aprofile(),
    p_anotifications(),
    const p_ahelp()
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
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.help_outline,
            ),
            label: 'Help',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: defultColor2,
        onTap: _onItemTapped,
      ),
    );
  }
}
