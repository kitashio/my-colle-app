import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_update_page.dart';

class ListDetailPage extends StatefulWidget {

  @override
  _ListDetailPageState createState() => _ListDetailPageState();
}

class _ListDetailPageState extends State<ListDetailPage> {

  String _label = '';

  _useCamera(BuildContext context, bool b) {
    setState(() {
      _label = 'You select ' + (b ? 'AGREE' : 'CANCEL');
    });
    Navigator.pop(context);
  }

  Future _showAlertDialog (BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('削除'),
          content: Text('本当に削除しますか？'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('いいえ'),
              onPressed: () => _useCamera(context, false),
            ),
            ElevatedButton(
              child: Text('はい'),
              onPressed: () => _useCamera(context, true),
            ),
          ]
        );
      },
    );
  }

  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<int>(
            icon: Icon(Icons.more_horiz),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("編集"),
                value: 0,
    ),
              PopupMenuItem(
                child: Text("削除"),
                value: 1,
              ),
            ],
        onSelected: (choice) {
          if (choice == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListUpdatePage()),
            );
        } else
          if (choice == 1) {
            _showAlertDialog (context);
          }
              }),
        ],
    ),
      body: Container(
        // 余白を付ける
        padding: EdgeInsets.fromLTRB(60, 130, 60, 0,),
        child: Center(
          child: Column(
            children: [
              Text('泥中の蓮',
              style: TextStyle(
                fontSize: 30,
              ),
              ),
              const SizedBox(height: 20),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(height: 15),
              Container(
                width: 100,
                height: 23,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                  color: Colors.grey,
                ),
                child: Text('意 味',
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
              ),
              const SizedBox(height: 30),
              Text('汚れた環境下でも影響されず、清らかな魅力を保っていること。',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
