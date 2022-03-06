import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myfirstapp/ui/Bottom_Tab_page.dart';

final UserSigininProvider = ChangeNotifierProvider<UserSigninController>(
      (ref) {
    return UserSigninController();
  },
);

class UserSigninController extends ChangeNotifier {

  static final googleLogin = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);

  void googleSignin (context) async {
    GoogleSignInAccount signinAccount = await googleLogin.signIn();
    if (signinAccount == null) return;

    GoogleSignInAuthentication auth = await signinAccount.authentication;
    final GoogleAuthCredential credential =
    GoogleAuthProvider.credential(
      idToken: auth.idToken,
      accessToken: auth.accessToken,
    );
    User user =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;

    if (user != null) {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomTabPage(user)),
      );
    } else {
      final snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text('ログインできませんでした'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      notifyListeners();
    }
  }
}