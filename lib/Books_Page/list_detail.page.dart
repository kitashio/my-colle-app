import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListDetailPage extends StatefulWidget {

  @override
  _ListDetailPageState createState() => _ListDetailPageState();
}

class _ListDetailPageState extends State<ListDetailPage> {
  var _selectedValue = 'Hawaii';
  var _usStates = ["California", "Hawaii", "Texas"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
          // PopupMenuButton<String>(
          //   onSelected: (String result) { setState(() { _selection = result; }); },
          //   itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          //     const PopupMenuItem<String>(
          //       value: String.harder,
          //       child: Text('Working a lot harder'),
          //     ),
          //     const PopupMenuItem<String>(
          //       value: String.smarter,
          //       child: Text('Being a lot smarter'),
          //     ),
          //   ],
          // ),
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