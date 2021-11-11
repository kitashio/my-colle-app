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
      appBar: NeumorphicAppBar(

      ),
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(246, 246, 246, 100)),
        child: NeumorphicBackground(
          padding: EdgeInsets.fromLTRB(20, 100, 20, 400),
          child: NeumorphicText('Flutter大学',
            textStyle: NeumorphicTextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 90,
            ),
          ),
        ),
      ),
    );
  }
}
