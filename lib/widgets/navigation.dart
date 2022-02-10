import 'package:qiosk/apis/auth_api.dart';
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
  UserLogin userlogin = UserLogin(
      userID: 0,
      email: "",
      password: "",
      isActive: false,
      isAdmin: false,
      token: "");
  bool isLoggedIn = false;

  //Navigation opties
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const MapPage(),
    const SummaryPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (userlogin.token != "") {}
      if (userlogin.isAdmin && userlogin.token != "") {
        _widgetOptions.insert(3, const AdminPage());
      }
      if (userlogin.token == "" && _widgetOptions.contains(const AdminPage())) {
        _widgetOptions.remove(const AdminPage());
      }
      getData();
      //Afmelden
      if ((userlogin.isActive && !userlogin.isAdmin && _selectedIndex == 3) ||
          (userlogin.isActive && userlogin.isAdmin && _selectedIndex == 4)) {
        _logout();
        _selectedIndex = 0;
      }
      getData();
    });
  }

  getData() async {
    // get data from shared_preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userlogin.userID = prefs.getInt('userID') ?? 0;
      userlogin.email = prefs.getString('email') ?? "";
      userlogin.isActive = prefs.getBool('isActive') ?? false;
      userlogin.isAdmin = prefs.getBool('isAdmin') ?? false;
      userlogin.token = prefs.getString('token') ?? "";
    });
  }

  String? get _logText {
    if (userlogin.token.length > 2) {
      return "Afmelden";
    }
    return "Aanmelden";
  }

//Navigation bar items
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: (_selectedIndex == 2 && !userlogin.isActive)
              ? LoginPage(onLogin: () => _login())
              : ((_selectedIndex == 3 && userlogin.isAdmin)
                  ? const AdminPage()
                  : _widgetOptions[_selectedIndex]),
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
            if (userlogin.isActive)
              const BottomNavigationBarItem(
                icon: Icon(Icons.article),
                label: 'Rapport',
              ),
            //Only show when logged as admin
            if (userlogin.isAdmin)
              const BottomNavigationBarItem(
                icon: Icon(Icons.admin_panel_settings),
                label: 'Admin',
              ),
            BottomNavigationBarItem(
              icon:
                  Icon(userlogin.token.length > 2 ? Icons.login : Icons.logout),
              label: _logText,
            )
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.white,
          selectedItemColor: const Color(0XFFFF6A00),
          onTap: _onItemTapped,
        ));
  }

  _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userlogin.email = prefs.getString('email') ?? "";
      userlogin.password = prefs.getString('password') ?? "";
    });

    AuthApi.authenticate(userlogin).then((result) async {
      // call the api to
      if (mounted) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        setState(() {
          userlogin = result;

          prefs.setInt('userID', userlogin.userID);
          prefs.setString('email', userlogin.email);
          prefs.setString('password', "");
          prefs.setBool('isActive', userlogin.isActive);
          prefs.setBool('isAdmin', userlogin.isAdmin);
          prefs.setString('token', userlogin.token);
        });
      }

      _selectedIndex = 2;
    });
  }

  _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove('password');
      prefs.remove('isActive');
      prefs.remove('isAdmin');
      prefs.remove('token');
    });
  }
}
