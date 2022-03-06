import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfirstapp/model/Mypage/Mypage_model.dart';

class MyPage extends ConsumerWidget {

  User user;
  MyPage(this.user);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:Color.fromRGBO(150, 186, 255, 100),
          title: Text('MyPage',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          actions: [
            Consumer(builder: (context, ref, child)  {
                return IconButton(
                    onPressed: () async {
                      ref.read(MyPageProvider).googleSignout();
                          await Navigator.pop(context);

                    },
                    icon: Icon(Icons.logout, size: 25),);
              }
            ),
          ],
        ),
        body: Consumer(builder: (context, ref, child)  {
            return Container(
              height: 330,
              alignment: Alignment.center,
              color: Color.fromRGBO(150, 186, 255, 100),
              padding: EdgeInsets.all(30),
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
                  Text(user.displayName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Email : ${user.email}'),

                ],
              ),
            );
          }
        ),
    );
  }
}