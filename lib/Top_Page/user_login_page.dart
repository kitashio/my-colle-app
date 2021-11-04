import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/Top_Page/user_add_page.dart';
import '../Bottom_Tab_page.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 160, 30, 0),
          child: Column(
            children: [
              Image.asset('assets/image/book.png',
                width: 70,),
              const SizedBox(height: 50),
              Text('ログイン',
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 15),
              TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text('アカウント未登録の方はこちらから登録'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}