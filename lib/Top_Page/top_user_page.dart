import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/Top_Page/user_add_page.dart';
import 'package:myfirstapp/Top_Page/user_login_page.dart';

class TopUserPage extends StatefulWidget {

  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopUserPage> {

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
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text('初めての方はこちら'),
                ),
              ),
              ButtonTheme(
                minWidth: 80.0,
                height: 250.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text('ログイン（アカウントをお持ちの方はこちら）'),
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
