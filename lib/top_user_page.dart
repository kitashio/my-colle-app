import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfirstapp/top_user_model.dart';

class TopUserPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(30,220,30,0),
            child: Column(
              children: [
                Image.asset('assets/image/logo.png',
                height: 200,),
                const SizedBox(height: 30),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 23,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Welcome  To  '),
                      TextSpan(text: 'Your Collection',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(62, 73, 122, 100)
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 150),
                Consumer(
                    builder: (context, ref, child) {
                      return SignInButton(
                          Buttons.Google,
                          text: 'Sign up with Google',
                          onPressed: () {
                            ref.read(UserSigininProvider).googleSignin(context);
                          }
                      );
                    }
                ),
              ],
            ),
          ),
      );
  }
}
