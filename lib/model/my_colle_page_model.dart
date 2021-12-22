import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Items.dart';

class CollectionPageModel with ChangeNotifier {

  List<Items> items;

  Future fetchData () async {
    final QuerySnapshot snapshot =  await FirebaseFirestore.instance
        .collection('collection')
        .doc('id_001')
        .collection('items')
        .get();

    final List<Items> items = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String title = data['title'];
      final String describe = data['describe'];
      return Items(title, describe);
    }).toList();

    this.items = items;
    notifyListeners();
  }

}