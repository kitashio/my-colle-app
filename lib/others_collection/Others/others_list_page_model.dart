import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfirstapp/model/Items.dart';

final OthersListPageProvider = ChangeNotifierProvider<OthersListPageModel>(
      (ref) {
    return OthersListPageModel();
  },
);

class OthersListPageModel with ChangeNotifier {

  late List<Items> othersListItems;

  Future fetchData (String collectionDocId) async {

    //コレクションを取得
    final QuerySnapshot snapshot =  await FirebaseFirestore.instance
        .collection('collection')
        .doc(collectionDocId)
        .collection('items')
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

    this.othersListItems = items;
    notifyListeners();
  }
}