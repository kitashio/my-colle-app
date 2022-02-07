import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:myfirstapp/model/Mypage/Mypage_model.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {

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
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Column(
                children: [

                ],
              ),
            );
          }
        ),
      ),
    );
  }
}