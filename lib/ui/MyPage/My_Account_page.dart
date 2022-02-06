import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'Mypage_page.dart';


class MyAccountPage extends StatelessWidget {

  static final googleLogin = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);

  void _showDialog (){


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page',
        style: TextStyle(
        fontSize: 18,
        ),
        ),
          automaticallyImplyLeading: false,
        backgroundColor:Color.fromRGBO(150, 186, 255, 100),

      ),
      body: Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: [

                  ElevatedButton(
                      onPressed: (){
                      },
                      child: Text('お'),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
