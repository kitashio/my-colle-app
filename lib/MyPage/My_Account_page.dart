import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'list_add_page.dart';

class MyAccountPage extends StatefulWidget {

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('マイページ'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('マイページ')
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}