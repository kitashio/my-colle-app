import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myfirstapp/model/Mypage/Mypage_model.dart';
import 'package:provider/provider.dart';

class MyPagee extends StatelessWidget {
  // //Google初期化
  User user;
  MyPagee(this.user);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => MypageModel(),
    child:  Scaffold(
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
              ],
            ),
          ),
        ),
    ),
    );
  }
}