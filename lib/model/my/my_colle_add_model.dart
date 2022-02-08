import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CollectionAddModel with ChangeNotifier {
  String title;
  String describe;
  File imageFile;

  final picker = ImagePicker();

  Future addItem (User user) async {
    //入力されているかの確認
    if (title == null||title.isEmpty) {
      throw 'タイトルが入力されていません。';
    }
    if (describe == null||describe.isEmpty) {
      throw '説明文が入力されていません。';
    }

    //ユーザ処理
    if (user == null) {
      throw 'uidError';
    }
    final uid = user.uid;

    //空のドキュメントを作成
    final doc = FirebaseFirestore.instance.collection('collection').doc();

    //画像処理
    String imgURL;
    if (imageFile != null) {
    //  storageにアップロード
      final task = await FirebaseStorage.instance
          .ref('collection/${doc.id}')
          .putFile(imageFile);
      imgURL = await task.ref.getDownloadURL();
    }

    //ドキュメントのフィールドを設定
    await doc.set({
      'docId': doc.id,
      'title': title,
      'describe': describe,
      'imgURL': imgURL,
      'uid': uid,
    });
  }

  //画像選択処理
  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      imageFile = File(pickedFile.path);
      notifyListeners();
  }

}