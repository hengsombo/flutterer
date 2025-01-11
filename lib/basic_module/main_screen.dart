import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/basic_module/fb_screen.dart';
import 'package:flutter_application_1/basic_module/login_screen.dart';
import 'package:flutter_application_1/basic_module/second_screen.dart';
//import 'package:flutter_application_1/basic_module/sample_state_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavBar(),
      endDrawer: _buildEndDrawer(),
    );
  }

  Widget _buildEndDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.network(
                "https://as1.ftcdn.net/v2/jpg/04/73/80/82/1000_F_473808286_ji029SZwOh2o1mXHiPR9ttviqokVUu56.jpg")),
            ListTile(
              Leading: Icon(Icons.home),
              title: Text("Home Page"),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text("Contact Us"),
              onTap: () {},
            ),
            ExpansionTile(
              title: Text("Theme Color"),
              initiallyExpanded: true,
              children: [
                ListTile(
                  leading: Icon(Icons.dark_mode),
                  title: Text("Change to Dark Mode"),
                  onTap: () {},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.network(
                  "https://as1.ftcdn.net/v2/jpg/04/73/80/82/1000_F_473808286_ji029SZwOh2o1mXHiPR9ttviqokVUu56.jpg"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                      builder: (context) => SimpleSateScreen(),
                      fullscreenDialog: true,
                ),
              },
            ),
            
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return IndexedStack(
      index: _currentIndex,
      children: [
        FbScreen(),
        SecondScreen(),
        LoginScreen(),
        SimpleStateScreen(),
      ],
    );
  }

  int _currentIndex = 0;

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        if (index == 3) {
          _scaffoldKey.currentSate!.openEndDrawer();
        } else {
          setState(() {
            _currentIndex = index();
          });
        }

        setState(() {
          _currentIndex = index;
        });
      },
      type: BottomNavigationBarType.shifting,
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.grey,
      // showSelectedLabels: false,
      // showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: " Menu",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ]
    );
  }
}
