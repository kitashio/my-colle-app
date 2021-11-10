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
          decoration: BoxDecoration(color: Color.fromRGBO(255, 243, 228, 100)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30,300,30,0),
            child: ListView(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Welcome  To  ',
                      ),
                      TextSpan(
                        text: 'My COLLE',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(61, 86, 178, 100),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 200),
                ElevatedButton(
                  child: Text('アカ登録'),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 8),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  child: Text('ログイン',
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 8),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
