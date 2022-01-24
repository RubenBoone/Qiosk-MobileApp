import 'package:qiosk/pages/admin.dart';
import 'package:qiosk/pages/home.dart';
import 'package:qiosk/pages/login.dart';
import 'package:qiosk/pages/map.dart';
import 'package:qiosk/pages/summary.dart';
import 'package:flutter/material.dart';

class BottomNavigationTemplate extends StatefulWidget {
  const BottomNavigationTemplate({Key? key}) : super(key: key);

  @override
  State<BottomNavigationTemplate> createState() =>
      _BottomNavigationTemplateState();
}

class _BottomNavigationTemplateState extends State<BottomNavigationTemplate> {
  int _selectedIndex = 0;
  //Navigation opties
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    MapPage(),
    SummaryPage(),
    AdminPage(),
    LoginPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//Navigation bar items
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0XFF575757),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Grondplan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Rapport',
          ), 
          //Only show when logged as admin
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'Admin',
          ), 
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Afmelden',
          )
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color(0XFFFF6A00),
        onTap: _onItemTapped,
      )
    );
  }
}
