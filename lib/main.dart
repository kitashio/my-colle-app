import 'package:flutter/material.dart';
import 'Top_Page/user_add_page.dart';

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
      home: RegisterPage(),
    );
  }
}