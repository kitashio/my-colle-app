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

  final String docId;

  ListPageModel({
    Key key,
    this.docId,
  });

  List<Items> listitems;

  Future fetchData () async {

    //コレクションを取得
    final QuerySnapshot snapshot =  await FirebaseFirestore.instance
        .collection('collection')
        .doc(docId)
        .collection('items')
        .get();

    final List<Items> items = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String title = data['title'];
      final String describe = data['describe'];
      final String imgURL = data['imgURL'];
      final String docId = data['docId'];
      final String uid = data['uid'];
      return Items(title, describe, imgURL, docId, uid);
    }).toList();

    this.listitems = items;
    notifyListeners();
  }

  int doclength = 0;

  Future countDocuments() async {
    QuerySnapshot _myDoc = await FirebaseFirestore.instance
        .collection('collection')
        .doc(docId)
        .collection('items')
        .get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    doclength = _myDocCount.length;
    return doclength;
  }


}