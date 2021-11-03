import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'My_Account_page.dart';
import '../Books_Page/list_add_page.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ホーム'),
          automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ホームページ'),
          ],

        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}