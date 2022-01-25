import 'package:qiosk/models/userlogin.dart';
import 'package:qiosk/pages/admin.dart';
import 'package:qiosk/pages/home.dart';
import 'package:qiosk/pages/login.dart';
import 'package:qiosk/pages/map.dart';
import 'package:qiosk/pages/summary.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavigationTemplate extends StatefulWidget {
  const BottomNavigationTemplate({Key? key}) : super(key: key);

  @override
  State<BottomNavigationTemplate> createState() =>
      _BottomNavigationTemplateState();
}

class _BottomNavigationTemplateState extends State<BottomNavigationTemplate> {
  int _selectedIndex = 0;
  UserLogin userlogin = UserLogin(userID: 0, email: "", password: "", isActive: false,isAdmin: false,token: "");
  bool loggedin = false;
  //Navigation opties
  static const  List<Widget> _widgetOptions = <Widget>[
 
    HomePage(),
    MapPage(),
    SummaryPage(),
    LoginPage(),
    AdminPage(),
  ];


  void _onItemTapped(int index) {
    
    setState(() {
      _selectedIndex = index;
      _selectedIndex= (userlogin.isAdmin&&userlogin.token!="")&&_selectedIndex==4 ?3:_selectedIndex;
      _selectedIndex= (userlogin.isAdmin&&userlogin.token!="")&&_selectedIndex==3 ?4:_selectedIndex;
      _selectedIndex= (userlogin.token=="")&&_selectedIndex==3 ?3:_selectedIndex;
      getData();
     //_selectedIndex= (!userlogin.isAdmin||userlogin.token=="")&&_selectedIndex==3?4:_selectedIndex; 
      
    });
  }
  getData() async {
   // get data from shared_preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    userlogin.userID = prefs.getInt('userID')??0;
    userlogin.email = prefs.getString('email')??"";
    userlogin.isActive = prefs.getBool('isActive')??false;
    userlogin.isAdmin= prefs.getBool('isAdmin')??false;
    userlogin.token = prefs.getString('token')??"";
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
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Grondplan',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Rapport',
          ), 
          //Only show when logged as admin
          const BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'Admin',
            
          ), 
          BottomNavigationBarItem(
            icon: Icon(userlogin.token=="" ?Icons.login:Icons.logout),
            label: userlogin.token!="" ?'Afmelden':'Aanmelden',
          )
        ],
        currentIndex:_selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color(0XFFFF6A00),
        onTap: _onItemTapped,
      )
    );
  }
}
