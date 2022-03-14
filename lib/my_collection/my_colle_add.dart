import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfirstapp/model/setting_model.dart';

import 'my/my_colle_add_model.dart';

class ColleAddPage extends ConsumerWidget {
  //collectionページからユーザ情報を受け取る
  User user;
  ColleAddPage(this.user);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: ref.read(AppbarProvider).setTitle('New collection'),
        iconTheme: IconThemeData(color: ref.read(AppbarProvider).setIconcolor(),),
        backgroundColor: ref.read(AppbarBackgroundColorProvider),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  // タイトル入力フィールド
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'コレクションタイトル',
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        )
                    ),
                    onChanged: (text){
                      ref.read(CollectionAddPageProvider).title = text;
                    },
                  ),
                  const SizedBox(height: 25),
                  // 説明文入力フィールド
                  TextField(
                    maxLines: 6,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        labelText: '説明',
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        )
                    ),
                    onChanged: (text){
                      ref.read(CollectionAddPageProvider).describe = text;
                    },
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 100,
                    // リスト追加ボタン
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ref.read(AppbarProvider).setIconcolor(), //ボタンの背景色
                      ),
                      onPressed: () {
                        ref.read(CollectionAddPageProvider).collectionAdd(context,user);
                      },
                      child: Text('登録'),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}