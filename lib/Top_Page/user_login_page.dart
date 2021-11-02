import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Bottom_Tab_page.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "メールアドレス"),
                onChanged: (String value) {
                },
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(labelText: "パスワード"),
                obscureText: true,
                onChanged: (String value) {
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BottomTabPage()),
                  );
                },
                child: Text("ログイン"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}