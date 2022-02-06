import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ListAddModel with ChangeNotifier {
  String title;
  String describe;
  String docId;
  File imageFile;

  final picker = ImagePicker();

  //Firestoreにアイテムを追加する処理
  Future addItem (String docId) async {
    //もしタイトルが入力されていない場合
    if (title == null||title.isEmpty) {
      throw 'タイトルが入力されていません。';
    }
    //もし説明文が入力されていない場合
    if (describe == null||describe.isEmpty) {
      throw '説明文が入力されていません。';
    }

    //ドキュメントを定義
    final doc = FirebaseFirestore.instance
        .collection('collection')
        .doc(docId)
        .collection('items')
        .doc();

    String imgURL;

    //もしFileがあれば
    if (imageFile != null) {
      //  storageにアップロード
      final task = await FirebaseStorage.instance
          .ref('collection/${docId}/items/${doc.id}')
          .putFile(imageFile);
      imgURL = await task.ref.getDownloadURL();
    }

    //ドキュメントをセット
    await doc.set({
      'title': title,
      'describe': describe,
      'imgURL': imgURL,
    });
  }

  //画像選択処理
  Future pickImage() async {
    //ライブラリを開いて選択
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    //選択した画像ファイルを代入
    imageFile = File(pickedFile.path);
    notifyListeners();
  }

}