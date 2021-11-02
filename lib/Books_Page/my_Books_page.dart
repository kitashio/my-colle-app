import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'my_list_page.dart';

class MyBookPage extends StatefulWidget {

  @override
  _MyBookPageState createState() => _MyBookPageState();
}

class _MyBookPageState extends State<MyBookPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My辞書'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
          children: [
            ButtonTheme(
              minWidth: 80.0,
              height: 250.0,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyListPage()),
                );
              },
            child: Text('辞書'),
            ),
            ),
          ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
