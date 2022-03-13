import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myfirstapp/my_account/mypage.dart';

final MyPageProvider = ChangeNotifierProvider<MypageModel>(
      (ref) {
    return MypageModel();
  },
);

class MypageModel extends ChangeNotifier {

  int CollectionLength = 0;
  void CollectionLengthCounter (String uid) async {
    QuerySnapshot _myDoc = await FirebaseFirestore.instance
        .collection('collection')
        .where("uid", isEqualTo: uid)
        .get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    CollectionLength = _myDocCount.length;
  }


  void googleSignout () {
    FirebaseAuth.instance.signOut();
  }

}