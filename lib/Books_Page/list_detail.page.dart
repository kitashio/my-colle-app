import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListDetailPage extends StatefulWidget {

  @override
  _ListDetailPageState createState() => _ListDetailPageState();
}

class _ListDetailPageState extends State<ListDetailPage> {
  final message = "Initial Message.";
  var _selectedValue = '編集';
  var _usStates = ["編集", "削除"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            onSelected: (String s) {
              setState(() {
                _selectedValue = s;
              });
            },
            itemBuilder: (BuildContext context) {
              return _usStates.map((String s) {
                return PopupMenuItem(
                  child: Text(s),
                  value: s,
                );
              }).toList();
            },
          ),
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

void popupMenuSelected(Menu selectedMenu){
  switch(selectedMenu) {
    case Menu.google_sign_in:
      _pushPage(context, GoogleSignInPage());
      break;
    case Menu.firestore_cloud_vision:
      _pushPage(context, FirestoreCloudVisionPage());
      break;
    default:
      break;
  }
}

void _pushPage(BuildContext context, Widget page) {
  Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page)
  );
}
}

class MyHomePage extends StatefulWidget {
  final String message;
  MyHomePage({this.message}):super() {}
  @override
  State<StatefulWidget> createState() => new ListDetailPage();
}