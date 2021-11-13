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
      _label = '削除しますか？' + (b ? 'はい' : 'いいえ');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromRGBO(150, 186, 255, 100),
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
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: [
            Image.asset('assets/image/IMG_6426.JPG',
            height: 300,
            width: 300,
            fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Text('タイトル',
              style: TextStyle(
              fontSize: 20,
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