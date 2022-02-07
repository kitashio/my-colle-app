import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/model/bottom_tab_model.dart';
import 'package:myfirstapp/ui/MyPage/Mypage_page.dart';
import 'package:myfirstapp/ui/my/my_colle_page.dart';
import 'package:myfirstapp/ui/others/others_colle_page.dart';
import 'package:provider/provider.dart';

class BottomTabPage extends StatelessWidget {

  final User user;
  BottomTabPage(this.user);

  int _currentIndex = 0;
  final _pageWidgets = [
    CollectionPage(),
    OthersCollectionPage(),
    MyPagee(user),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => BottomTabModel(),
      child: Consumer<BottomTabModel>(builder: (context, model, child) {
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
            fixedColor: Colors.indigo,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
          ),
        );
      }
      ),
    );
  }
  void _onItemTapped (int index) =>  _currentIndex = index;
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<User>('user', user));
    properties.add(DiagnosticsProperty<User>('user', user));
    properties.add(DiagnosticsProperty<User>('user', user));
    properties.add(DiagnosticsProperty<User>('user', user));
  }
}
