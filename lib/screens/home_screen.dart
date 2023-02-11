import 'package:flutter/material.dart';
import 'package:sitake_mobile/screens/learning_screen.dart';

import '../utils/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Material(
      child: Container(child: Text("under construction")),
    ),
    LearningScreen(),
    Material(
      child: Container(child: Text("under construction")),
    ),
    Material(
      child: Container(child: Text("under construction")),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.logout,
              color: Colors.black87,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedIndex,
            showUnselectedLabels: true,
            onTap: _onItemTapped,
            fixedColor: AppColor.lightBlack,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.book), label: "learning"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.fingerprint), label: "absen"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "profile"),
            ]),
        body: _screens.elementAt(_selectedIndex));
  }
}
