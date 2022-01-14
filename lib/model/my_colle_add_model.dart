import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CollectionAddModel with ChangeNotifier {
  String title;
  String describe;
  File imageFile;

  final picker = ImagePicker();

  Future addItem () async {
    if (title == null||title.isEmpty) {
      throw 'タイトルが入力されていません。';
    }

    if (describe == null||describe.isEmpty) {
      throw '説明文が入力されていません。';
    }

    final doc = FirebaseFirestore.instance.collection('collection') // コレクションID指定
        .doc('id_001') // ドキュメントID自動生成(collection)
        .collection('items')
        .doc();

    String imgURL;
    if (imageFile != null) {
    //  storageにアップロード
      final task = await FirebaseStorage.instance
          .ref('collection/id_001/items/${doc.id}')
          .putFile(imageFile);
      imgURL = await task.ref.getDownloadURL();

    }

    await doc.set({
      'title': title,
      'describe': describe,
      'imgURL': imgURL,
    });
  }

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      imageFile = File(pickedFile.path);
      notifyListeners();
  }

}