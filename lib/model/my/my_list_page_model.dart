import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Items.dart';

final ItemListPageProvider = ChangeNotifierProvider<ListPageModel>(
      (ref) {
    return ListPageModel();
  },
);

class ListPageModel with ChangeNotifier {

  List<Items> listitems;

  Future fetchData (String collectionDocId) async {

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

    this.listitems = items;
    notifyListeners();
  }

  int listDocLength = 0;
  void listDocLengthCounter (String docId) async {
    QuerySnapshot _myDoc = await FirebaseFirestore.instance
        .collection('collection')
        .doc(docId)
        .collection('items')
        .get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    listDocLength = _myDocCount.length;
  }



}