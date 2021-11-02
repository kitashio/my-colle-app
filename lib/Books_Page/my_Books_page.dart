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
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("スパイダーマン"),
            ),
            ListTile(
              title: Text("バイオハザード RE:2"),
            ),
            ListTile(
              title: Text("ファイナルファンタジー７リメイク"),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyListPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
