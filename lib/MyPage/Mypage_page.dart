import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
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
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/image/IMG_6426.JPG'),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('minn',
              style: TextStyle(
                fontSize: 20,
              ),
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
              ),
              Container(
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
              ],
            ),
          ),
        ),
    );
  }
}