import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'My_Account_page.dart';

class MyPage extends StatelessWidget {
  //Google初期化
  User user;
  MyPage(this.user);
  static final googleLogin = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyPage',
        style: TextStyle(
          fontSize: 18,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/image/IMG_6426.JPG',
              height: 170,
              width: 170,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text('Google名 : ${user.displayName}'),
            SizedBox(height: 20),
            TextButton(
              onPressed: () async {
                FirebaseAuth.instance.signOut();
                await Navigator.pop(context);
              },
              child: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}