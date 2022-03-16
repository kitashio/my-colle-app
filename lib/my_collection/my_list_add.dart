import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfirstapp/model/setting_model.dart';

import 'my/my_list_add_model.dart';

class ListAddPage extends ConsumerWidget {

  final String collectionDocId;
  const ListAddPage(this.collectionDocId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(

      appBar: AppBar(
        title: ref.read(AppbarProvider).setTitle('New Item'),
        iconTheme: IconThemeData(color: ref.read(AppbarProvider).setIconcolor(),),
        backgroundColor: ref.read(AppbarBackgroundColorProvider),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: <Widget>[
              //アイテムの画像設定
              GestureDetector(
                onTap: () async {
                  //タップして画像選択
                  await ref.read(ItemListAddProvider).pickImage();
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 200, width: 200,
                      child: ref.watch(ItemListAddProvider).imageFile != null
                          ? Image.file(ref.watch(ItemListAddProvider).imageFile, fit: BoxFit.cover,)
                          : Container(color: Colors.grey,),
                    ),
                    Icon(Icons.add_circle,
                      size: 35,
                      color: Colors.white,),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              //タイトルのテキスト入力フォーム
              TextField(
                decoration: InputDecoration(
                    labelText: 'タイトル',
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )
                ),
                onChanged: (text){
                  //入力されたテキストを代入
                  ref.read(ItemListAddProvider).title = text;
                },
              ),
              const SizedBox(height: 8),
              // アイテムの説明文設定
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
                  //入力されたテキストを代入
                  ref.read(ItemListAddProvider).describe = text;
                },
              ),
              const SizedBox(height: 30),
              //★
              //リスト追加ボタン
              Container(
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ref.read(AppbarProvider).setIconcolor(),//ボタンの背景色
                    ),
                  onPressed: () async {
                    try {
                      //もしタイトルが入力されていない場合
                      if (ref.read(ItemListAddProvider).title == null||
                          ref.read(ItemListAddProvider).title.isEmpty) {
                        throw 'タイトルが入力されていません。';
                      }
                      //もし説明文が入力されていない場合
                      if (ref.read(ItemListAddProvider).describe == null||
                          ref.read(ItemListAddProvider).describe.isEmpty) {
                        throw '説明文が入力されていません。';
                      }
                      showGeneralDialog(
                          context: context,
                          barrierDismissible: false,
                          barrierColor: Colors.black.withOpacity(0.5),
                          pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
                            return Center(
                              child: CircularProgressIndicator(color: Colors.white,),
                            );
                          }
                      );
                      //Firestoreにdoc追加
                      await ref.read(ItemListAddProvider).addItem(collectionDocId);
                      //前画面に戻る
                      Navigator.of(context).pop(true);
                      Navigator.of(context).pop(true);
                    } catch (e) {
                      //前画面でスナックバー表示
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
        ),
      ),
    );
  }
}