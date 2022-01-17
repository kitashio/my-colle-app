import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'my_list_update.dart';

class ListDetailPage extends StatefulWidget {
  String _itemtitle;

  @override
  _ListDetailPageState createState() => _ListDetailPageState(_itemtitle);
}

class _ListDetailPageState extends State<ListDetailPage> {

  _ListDetailPageState(this._itemtitle);
  String _itemtitle;

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
        title: Text('1/20',
        style: TextStyle(
          fontSize: 16,
        ),
        ),
        actions: [
          //右上のポップアップメニュー
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
              MaterialPageRoute(builder: (context) => ListUpdatePage(_itemtitle)),
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
              Text(_itemtitle,
              style: TextStyle(
              fontSize: 20,
              ),
              ),
              const SizedBox(height: 20),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(height: 20),
              Text('汚れた環境下でも影響されず、清らかな魅力を保っていること。',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,

                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}