import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final ItemListAddProvider = ChangeNotifierProvider<ListAddModel>(
      (ref) {
    return ListAddModel();
  },
);

class ListAddModel with ChangeNotifier {
  String title;
  String describe;
  String docId;
  File imageFile;

  final picker = ImagePicker();

  //Firestoreにアイテムを追加する処理
  Future addItem (String docId) async {

    //ドキュメントを定義
    final doc = FirebaseFirestore.instance
        .collection('collection')
        .doc(docId)
        .collection('items')
        .doc();

    //追加した時間を登録する
    DateTime now = DateTime.now();
    Timestamp createdAt = Timestamp.fromDate(now);

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
      'createdAt': createdAt,
    });
  }

  //画像選択処理
  Future pickImage() async {
    //ライブラリを開いて選択
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,
        imageQuality: 60);
    //選択した画像ファイルを代入
    imageFile = File(pickedFile.path);
    notifyListeners();
  }

}