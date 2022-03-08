import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final CollectionAddPageProvider = ChangeNotifierProvider<CollectionAddModel>(
      (ref) {
    return CollectionAddModel();
  },
);

class CollectionAddModel extends ChangeNotifier {
  String title  = '';
  String describe = '';
  File imageFile;
  final picker = ImagePicker();


  Future addItem (User user) async {
    //入力されているかの確認
    if (imageFile == null) {
      throw '画像が選択されていません。';
    }
    if (title == null||title.isEmpty) {
      throw 'タイトルが入力されていません。';
    }
    if (describe == null||describe.isEmpty) {
      throw '説明文が入力されていません。';
    }

    //ユーザ処理
    if (user == null) {
      throw 'ユーザが取得できませんでした。';
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
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,imageQuality: 70);
      imageFile = File(pickedFile.path);
    if (imageFile == null) {
      print('NoImage');
    }
      notifyListeners();
  }

  void collectionAdd (context, User user) async {
    try {
      //コレクションデータをFiretoreへ保存
      await addItem(user);
      //前画面（コレクションページ）へ戻る
      Navigator.of(context).pop(true);
    } catch (e) {
      //処理完了後スナックバー表示する
      final snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(e.toString()),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

}