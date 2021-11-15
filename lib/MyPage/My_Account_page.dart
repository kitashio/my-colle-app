import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Mypage_Google_login.dart';

// import 'list_add_page.dart';

class MyAccountPage extends StatefulWidget {

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GoogleLoginPage()),
                    );
                  },
                  child: Text('Googleでサインイン',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: (){},
                child: Text('Twitterでサインイン',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: (){},
                child: Text('LINEでサインイン',
                  style: TextStyle(
                    fontSize: 16,
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