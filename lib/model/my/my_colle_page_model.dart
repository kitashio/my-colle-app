import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Items.dart';

final CollectionPageProvider = ChangeNotifierProvider<CollectionPageModel>(
      (ref) {
    return CollectionPageModel();
  },
);

class CollectionPageModel extends ChangeNotifier {

  List<Items> items;

  //コレクションデータを全て取得
  Future fetchData (User user) async {

    final uid = user.uid;

    //コレクションを取得
    final QuerySnapshot snapshot =  await
    FirebaseFirestore.instance.collection('collection').where("uid", isEqualTo: uid).get();

    //コレクションのデータをリスト型にする
    final List<Items> items = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String title = data['title'];
      final String describe = data['describe'];
      final String imgURL = data['imgURL'];
      final String docId = data['docId'];
      final String uid = data['uid'];
      return Items(title, describe, imgURL, docId, uid);
    }).toList();

    this.items = items;
    notifyListeners();
  }

}