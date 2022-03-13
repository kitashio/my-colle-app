import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/Items.dart';

final CollectionPageProvider = ChangeNotifierProvider<CollectionPageModel>(
      (ref) {
    return CollectionPageModel();
  },
);

class CollectionPageModel extends ChangeNotifier {

  List<Items> collectionItems;
  List<Items> items;


  //コレクションデータを全て取得
  Future fetchData (User user) async {

    final uid = user.uid;

    //コレクションを取得
    final QuerySnapshot snapshot =  await
    FirebaseFirestore.instance.collection('collection')
        .where("uid", isEqualTo: uid)
        .orderBy("createdAt", descending: true)
        .get();

    //コレクションのデータをリスト型にする
    final List<Items> items = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String title = data['title'];
      final String describe = data['describe'];
      final String imgURL = data['imgURL'];
      final String docId = data['docId'];
      final String uid = data['uid'];
      final Timestamp createdAt = data['createdAt'];

      return Items(title, describe, imgURL, docId, uid, createdAt);
    }).toList();

    this.collectionItems = items;
    notifyListeners();
  }

  Future fetchItemsData (String collectionDocId) async {

    //コレクションを取得
    final QuerySnapshot snapshot =  await FirebaseFirestore.instance
        .collection('collection')
        .doc(collectionDocId)
        .collection('items')
        .orderBy("createdAt", descending: true)
        .get();

    final List<Items> items = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String title = data['title'];
      final String describe = data['describe'];
      final String imgURL = data['imgURL'];
      final String docId = data['docId'];
      final String uid = data['uid'];
      final Timestamp createdAt = data['createdAt'];

      return Items(title, describe, imgURL, docId, uid, createdAt);
    }).toList();

    this.items = items;
    notifyListeners();
  }

}