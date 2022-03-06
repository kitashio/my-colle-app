import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/my/my_colle_add_model.dart';

//　【My】2.コレクション追加画面
class ColleAddPage extends StatelessWidget {
  //collectionページからユーザ情報を受け取る
  User user;
  ColleAddPage(this.user);

  @override
  Widget build(BuildContext context) {
    child: Scaffold(
      appBar: AppBar(
        title: Text('New Collection',
        style: TextStyle(fontSize: 18,),
        ),
        backgroundColor:Color.fromRGBO(150, 186, 255, 100),
      ),
      body: Consumer(builder: (context, ref,child) {
          return Padding(
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
                      IconButton(icon: Icon(Icons.add_circle,
                          size: 35,
                          color: Colors.white,
                          )
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
                    onPressed: () async {
                      try {
                        //コレクションデータをFiretoreへ保存
                        await ref.read(CollectionAddPageProvider).addItem(user);
                        //前画面（コレクションページ）へ戻る
                        Navigator.of(context).pop(true);
                      } catch (e) {
                        print(e.toString());
                        //処理完了後スナックバー表示する
                        final snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(e.toString()),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Text('登録'),
                  ),
                ),

              ],
            ),
          );
        }
      ),
    );
  }
}