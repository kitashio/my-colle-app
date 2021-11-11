import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Books_Page/my_colle_page.dart';
import 'MyPage/My_Account_page.dart';
import 'Home_Page/home_page.dart';

class BottomTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomTabPageState();
  }
}

class _BottomTabPageState extends State<BottomTabPage> {

  int _currentIndex = 0;
  final _pageWidgets = [
    MyBookPage(),
    MyHomePage(),
    MyAccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.lens_outlined), label: 'My',),
          BottomNavigationBarItem(icon: Icon(Icons.fiber_smart_record_outlined), label: 'Others',),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: 'Mypage',),
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.indigo,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) => setState(() => _currentIndex = index );
}