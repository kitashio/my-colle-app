import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
        title: Text('Others Collection',
        style: TextStyle(
          fontSize: 18,
        ),),
        automaticallyImplyLeading: false,
        backgroundColor:Color.fromRGBO(150, 186, 255, 100),
      ),
      body: Container(
        // decoration: BoxDecoration(color: Color.fromRGBO(147, 181, 198, 100)),

        ),
    );
  }
}
