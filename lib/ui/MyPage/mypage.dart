import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myfirstapp/model/Mypage/Mypage_model.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {

  static final googleLogin = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MypageModel(),
      child:  Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:Color.fromRGBO(150, 186, 255, 100),
          title: Text('MyPage',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        body: Consumer<MypageModel>(builder: (context, model, child)  {
          return Container(
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
                    ElevatedButton(
                        onPressed: () async {
                          await model.showAlertDialog(context);
                        },
                        child: Text('あ'),
                    ),
                    ],
                  ),
                ),
              );
          }
        ),
      ),
    );
  }
}