import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CollectionAddModel with ChangeNotifier {
  String title;
  String describe;

  void SetCollection () async {
    await FirebaseFirestore.instance
      .collection('collection') // コレクションID指定
      .doc('id_001') // ドキュメントID自動生成(collection)
      .collection('items')
      .doc() // ドキュメントID自動生成(items)
      .set({
      'title': title,
      'describe': describe,
      });
      }
}