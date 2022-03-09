import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myfirstapp/ui/MyPage/mypage.dart';

final MyPageProvider = ChangeNotifierProvider<MypageModel>(
      (ref) {
    return MypageModel();
  },
);

class MypageModel extends ChangeNotifier {

  void googleSignout () {
    FirebaseAuth.instance.signOut();
  }

}