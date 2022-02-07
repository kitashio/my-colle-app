import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfirstapp/model/top_user_model.dart';
import 'package:provider/provider.dart';
import 'Bottom_Tab_page.dart';

class TopUserPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => TopUserModel(),
    child: Scaffold(
      body: Consumer<TopUserModel>(builder: (context, model, child)  {
          return Padding(
            padding: const EdgeInsets.fromLTRB(30,300,30,0),
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 23,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Welcome  To  ',
                      ),
                      TextSpan(
                        text: 'My COLLE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(61, 86, 178, 100),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 250),
                ElevatedButton(
                  child: Text('スタート',
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(97, 102, 179, 100),
                    shape: const StadiumBorder(),
                    padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BottomTabPage()),
                    );
                  },
                ),
                SignInButton(
                  Buttons.Google,
                  text: 'Sign up with Google',
                  onPressed: () {
                    model.googleSignin(context);
                  },
                ),
              ],
            ),
          );
        }
      ),
    ),
    );
  }
}
