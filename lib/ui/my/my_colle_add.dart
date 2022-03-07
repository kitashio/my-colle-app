import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfirstapp/model/setting_model.dart';
import '../../model/my/my_colle_add_model.dart';

class ColleAddPage extends ConsumerWidget {
  //collectionページからユーザ情報を受け取る
  User user;
  ColleAddPage(this.user);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NewCollection',
        style: TextStyle(fontSize: 18,),
        ),
        backgroundColor: ref.read(colorSetProvider),
      ),
      body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                //画像選択フィールド
                GestureDetector(
                  onTap: () async {
                    //画像選択処理
                    await ref.read(CollectionAddPageProvider).pickImage();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: ref.read(CollectionAddPageProvider).imageFile != null
                        ? Image.file(ref.read(CollectionAddPageProvider).imageFile, fit: BoxFit.cover,)
                       : Container(color: Colors.grey,),
                      ),
                      Icon(Icons.add_circle,
                        size: 35,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
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
                      primary: Color.fromRGBO(150, 186, 255, 100), //ボタンの背景色
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
    );
  }
}