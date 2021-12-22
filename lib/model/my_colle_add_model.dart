import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CollectionAddModel with ChangeNotifier {
  String title;
  String describe;

  Future addItem () async {
    if (title == null) {
      throw 'タイトルが入力されていません。';
    }

    if (describe == null) {
      throw '説明文が入力されていません。';
    }

    await FirebaseFirestore.instance.collection('collection') // コレクションID指定
        .doc('id_001') // ドキュメントID自動生成(collection)
        .collection('items')
        .add({
      'title': title,
      'describe': describe,
    });
  }

}