import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfirstapp/Top_Page/user_login_page.dart';
import '../Bottom_Tab_page.dart';

class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(61, 86, 178, 100),),
          padding: EdgeInsets.fromLTRB(30, 160, 30, 0),
          child: Column(
            children: [
              // Image.asset('assets/image/book.png',
              // width: 70,),
              const SizedBox(height: 50),
              Text('SIGN UP',
              style: GoogleFonts.raleway(
                color:  Colors.white,
                fontSize: 25,
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
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BottomTabPage()),
                  );
                  Future<bool> _willPopCallback() async {
                    return true;
                  }
                },
                child: Text("＞＞"),
              ),
              const SizedBox(height: 15),
              TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                    },
                  child: Text('アカウントをお持ちの方はこちらからログイン',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}