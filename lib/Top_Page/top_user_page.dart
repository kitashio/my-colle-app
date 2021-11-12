import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfirstapp/Top_Page/user_add_page.dart';
import 'package:myfirstapp/Top_Page/user_login_page.dart';

class TopUserPage extends StatefulWidget {

  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopUserPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30,300,30,0),
            child: ListView(
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
                  child: Text('Start →︎',
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(150, 186, 255, 100),
                    shape: const StadiumBorder(),
                    padding: EdgeInsets.all(10),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                ),
                const SizedBox(height: 8),
                //■　ログインボタン
                // ElevatedButton(
                //   child: Text('SIGN IN',
                //     style: GoogleFonts.raleway(
                //       color: Colors.white,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                //   style: ElevatedButton.styleFrom(
                //     primary: Colors.black38,
                //     shape: const StadiumBorder(),
                //     padding: EdgeInsets.fromLTRB(15, 5, 15, 8),
                //   ),
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => LoginPage()),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
