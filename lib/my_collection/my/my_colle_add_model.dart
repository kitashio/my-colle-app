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

    if (title == null||title.isEmpty) {
      throw 'タイトルが入力されていません。';
    }
    // if (describe == null||describe.isEmpty) {
    //   throw '説明文が入力されていません。';
    // }

    //ユーザ処理
    if (user == null) {
      throw 'ユーザが取得できませんでした。';
    }
    final uid = user.uid;

    DateTime now = DateTime.now();
    Timestamp createdAt = Timestamp.fromDate(now);

    //空のドキュメントを作成
    final doc = FirebaseFirestore.instance.collection('collection').doc();

    //ドキュメントのフィールドを設定
    await doc.set({
      'docId': doc.id,
      'title': title,
      'describe': describe,
      'uid': uid,
      'createdAt': createdAt,

    });
  }

  void collectionAdd (context, User user) async {
    bool visibleLoading = false;
    try {
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierColor: Colors.black.withOpacity(0.5),
          pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
      );
      //コレクションデータをFiretoreへ保存
      await addItem(user);
      //前画面（コレクションページ）へ戻る
      Navigator.of(context).pop(true);
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