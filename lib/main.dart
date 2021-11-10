import 'package:flutter/material.dart';
import 'Top_Page/top_user_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My辞書',
      theme: ThemeData(
        // textTheme: GoogleFonts.sawarabiMinchoTextTheme(
        //   Theme.of(context).textTheme,
        // ),
        primarySwatch: Colors.cyan,
      ),
      home: TopUserPage(),
    );
  }
}