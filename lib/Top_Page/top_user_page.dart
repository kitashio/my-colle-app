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
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30,500,30,0),
            child: ListView(
              children: [
                ElevatedButton(
                  child: Text('アカウント登録'),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 8),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  child: Text('ログイン',
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 8),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
