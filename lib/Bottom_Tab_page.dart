import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/my_account/mypage.dart';
import 'package:myfirstapp/my_collection/my_colle_page.dart';

import 'others_collection/others_colle_page.dart';

class BottomTabPage extends StatefulWidget {
  final User user;
  BottomTabPage(this.user);

  @override
  _BottomTabPageState createState() => _BottomTabPageState();
}


class _BottomTabPageState extends State<BottomTabPage>{

  int _currentIndex = 0;
  void _onItemTapped (int index) => setState(() => _currentIndex = index );

  @override
  Widget build(BuildContext context) {

    final _pageWidgets = [
      CollectionPage(widget.user),
      OthersCollectionPage(widget.user),
      MyPage(widget.user),
    ];

    return Scaffold(
          body: _pageWidgets.elementAt(_currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.lens_outlined), label: 'My',),
              BottomNavigationBarItem(
                icon: Icon(Icons.fiber_smart_record_outlined),
                label: 'Others',),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: 'Mypage',),
            ],
            currentIndex: _currentIndex,
            fixedColor: Colors.black,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
          ),
        );
  }

}
