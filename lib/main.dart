import 'package:flutter/material.dart';

import 'Bottom_Tab_page.dart';
import 'Home_Page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My辞書',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BottomTabPage(),
    );
  }
}