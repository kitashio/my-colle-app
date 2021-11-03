import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListDetailPage extends StatefulWidget {

  @override
  _ListDetailPageState createState() => _ListDetailPageState();
}

class _ListDetailPageState extends State<ListDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        // 余白を付ける
        padding: EdgeInsets.all(64),
        child: Center(
          child: Column(
            children: [
              Text('泥中の蓮',
              style: TextStyle(
                fontSize: 30,
              ),
              ),
              Divider(
                height: 40,
                thickness: 1,
                color: Colors.grey,
                indent: 16,
                endIndent: 16,
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}