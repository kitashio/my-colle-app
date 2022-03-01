import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/model/my/my_colle_page_model.dart';
import '../../Items.dart';
import 'my_colle_add.dart';
import 'package:provider/provider.dart';
import 'my_list_page.dart';

class CollectionPage extends StatelessWidget {
  User user;
  CollectionPage(this.user);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => CollectionPageModel()..fetchData(user),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor:Color.fromRGBO(150, 186, 255, 100),
            title: Text('My Collection',
              style: TextStyle(fontSize: 18),
            ),
            //★
            //コレクション追加画面へ遷移するボタン
            actions: [
              Consumer<CollectionPageModel>(builder: (context, model, child)  {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: IconButton(icon: Icon(Icons.add, size: 33),
                    onPressed: () async {
                      //タップしてコレクション追加画面へ遷移
                      //追加されてもされてなくても返ってくる
                      final bool added = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ColleAddPage(user)),
                      );
                      //もしコレクションがあったら（追加されていたら）スナックバー表示
                      if (added != null && added) {
                        final snackBar = SnackBar(
                          backgroundColor: Colors.blue,
                          content: Text('コレクションを追加しました'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      //コレクション更新
                      await model.fetchData(user);
                     }
                    ),
                  );
                }
              )
            ],
          ),

          body: Consumer<CollectionPageModel>(builder: (context, model, child)  {

            final List<Items> items = model.items;

            //もしコレクションのデータがなければ（取得中も含む）
            //ぐるぐるを表示
            if (items == null) {
              return const CircularProgressIndicator();
            }

            //コレクションデータをリスト表示
            final List<Widget> widgets = items.map((items) =>
                GestureDetector(
                  onTap: () async {
                    //それぞれデータを定義
                    final String _docId = items.docId;
                    final String _title = items.title;
                    final String _describe = items.describe;
                    final String _uid = items.uid;
                    //タップしたら画面遷移＋データも渡す
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListPage(collectionTitle: _title,collectionDiscribe: _describe,docId: _docId,uid: _uid,)),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center,//中央寄せ
                    children:[
                      //コレクションの画像表示
                      ClipRRect(
                        //画象を角丸にする
                        borderRadius: BorderRadius.circular(5),
                        child: items.imgURL != null
                        ? Image.network(items.imgURL,
                        height: 170, width: 170, fit: BoxFit.cover,)
                        : null,
                      ),
                      //コレクションのタイトル表示
                      Text(items.title??'title',
                        textAlign: TextAlign.center,//テキスト中央寄せ
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
            ).toList(); //リスト型へ

            //グリッドの画面オーバーエラーを防ぐためのスクロールビュー
            return SingleChildScrollView(
              child: GridView.count(
                  crossAxisCount: 2,//2列
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(0),
                  children: widgets
              ),
            );
          }
          ),
        ),
    );
  }
}
