import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Items.dart';

class ListPageModel with ChangeNotifier {
  String itemtitle = '僕';


  List<Items> items;

  Future fetchData () async {
    //コレクションを取得
    final QuerySnapshot snapshot =  await FirebaseFirestore.instance
        .collection('collection')
        .doc('wIWA9jDdrDu2Iljs69gB')
        .collection('a')
        .get();

    final List<Items> items = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String title = data['title'];
      final String describe = data['describe'];
      final String imgURL = data['imgURL'];
      return Items(title, describe, imgURL);
    }).toList();

    this.items = items;
    notifyListeners();
  }

}