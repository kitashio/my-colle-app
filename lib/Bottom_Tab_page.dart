import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Books_Page/my_Books_page.dart';
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
    MyHomePage(),
    MyBookPage(),
    MyAccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('ホーム')),
          BottomNavigationBarItem(icon: Icon(Icons.book), title: Text('My辞書')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('マイページ')),
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.cyan,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) => setState(() => _currentIndex = index );
}