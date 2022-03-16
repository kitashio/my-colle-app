import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfirstapp/model/setting_model.dart';

import 'Mypage_model.dart';

class MyPage extends ConsumerWidget {

  User user;
  MyPage(this.user);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

   ref.read(MyPageProvider).CollectionLengthCounter(user.uid);
   final collectionLength = ref.read(MyPageProvider).CollectionLength;

    return Scaffold(
        appBar: AppBar(
          title: ref.read(AppbarProvider).setTitle('My page'),
          iconTheme: IconThemeData(color: ref.read(AppbarProvider).setIconcolor(),),
          automaticallyImplyLeading: false,
          backgroundColor:Colors.white,
          elevation: 0.0,
          actions: [
            Consumer(builder: (context, ref, child)  {
                return IconButton(
                    onPressed: () async {
                      ref.read(MyPageProvider).googleSignout();
                          Navigator.pop(context);
                    },
                    icon: Icon(Icons.logout, size: 25),);
              }
            ),
          ],
        ),
        body: Container(
              height: 330,
              alignment: Alignment.center,
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
                        image: NetworkImage('${user.photoURL}'),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(user.displayName!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'My collections :  ',
                              style: TextStyle(color: Colors.black),),
                            TextSpan(text: '${collectionLength}',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: ref.read(AppbarProvider).setAccentcolor(),),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'Favorite :  ',
                              style: TextStyle(color: Colors.black),),
                            TextSpan(text: '0',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: ref.read(AppbarProvider).setAccentcolor(),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
    );
  }
}