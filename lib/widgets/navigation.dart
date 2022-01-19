import 'package:Qiosk/pages/home.dart';
import 'package:Qiosk/pages/summary.dart';
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
    SummaryPage()
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
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Summary',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}