import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CollectionPageModel with ChangeNotifier {

  void fetchData () async {
    await FirebaseFirestore.instance
        .collection('collection')
        .doc('id_001')
        .collection('items')
        .get();

    notifyListeners();
  }

}