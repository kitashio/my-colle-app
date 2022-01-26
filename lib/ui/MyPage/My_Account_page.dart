import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Mypage_page.dart';


class MyAccountPage extends StatefulWidget {

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
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
              Container(
                child: SignInButton(
                Buttons.Google,
                text: 'Sign up with Google',
                onPressed: () async {
                  GoogleSignInAccount signinAccount = await googleLogin.signIn();
                  if (signinAccount == null) return;

                  GoogleSignInAuthentication auth = await signinAccount.authentication;
                  final GoogleAuthCredential credential =
                  GoogleAuthProvider.credential(
                    idToken: auth.idToken,
                    accessToken: auth.accessToken,
                  );
                  User user =
                      (await FirebaseAuth.instance.signInWithCredential(credential))
                          .user;
                  if (user != null) {
                    await Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) {
                        return MyPage(user);
                      }),
                    );
                  }
                },
              ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
