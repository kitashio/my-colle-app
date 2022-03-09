import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfirstapp/Items.dart';


final OthersCollectionPageProvider = ChangeNotifierProvider<OthersCollectionPageModel>(
      (ref) {
    return OthersCollectionPageModel();
  },
);

class OthersCollectionPageModel with ChangeNotifier {

  List<Items> othersitems;

  Future fetchData () async {
    //コレクションを取得
    final QuerySnapshot snapshot =  await FirebaseFirestore.instance
        .collection('collection')
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

    this.othersitems = items;
    notifyListeners();
  }


}