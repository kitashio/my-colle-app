import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfirstapp/model/setting_model.dart';
import '../model/Items.dart';
import 'my/my_colle_add_model.dart';
import 'my/my_colle_page_model.dart';
import 'my_colle_add.dart';
import 'my_list_page.dart';

class CollectionPage extends ConsumerWidget {

  User user;
  CollectionPage(this.user);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
          appBar: AppBar(
            title: ref.read(AppbarProvider).setTitle('My collection'),
            iconTheme: IconThemeData(color: ref.read(AppbarProvider).setIconcolor(),),
            automaticallyImplyLeading: false,
            backgroundColor: ref.read(AppbarBackgroundColorProvider),
            elevation: 0.0,
            //コレクション追加画面へ遷移するボタン
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: IconButton(icon: Icon(Icons.add, size: 33,
                  color: ref.read(AppbarProvider).setIconcolor(),),
                onPressed: () async {
                  //タップしてコレクション追加画面へ遷移
                  //追加されてもされてなくても返ってくる
                  final bool added = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => ColleAddPage(user)),
                  );
                  ref.watch(CollectionAddPageProvider).title = null;
                  ref.watch(CollectionAddPageProvider).describe = null;
                  //もしコレクションがあったら（追加されていたら）スナックバー表示
                  if (added != null && added) {
                    final snackBar = SnackBar(
                      content: Text('コレクションを追加しました'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  //コレクション更新
                  await ref.watch(CollectionPageProvider).fetchData(user);
                 }
                ),
              ),
            ],
          ),
          body: FutureBuilder(
            future: ref.read(CollectionPageProvider).fetchData(user),//データ取得
            builder: (BuildContext context, snapshot,) {

            final List<Items> collections = ref.read(CollectionPageProvider).collectionItems;

            //取得中のローディング表示
            if (collections == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            //データ１つずつウィジェット作る
            final widgets = collections.map((collections) =>
                StreamBuilder(
                  //コレクションのアイテムを取得
                  stream: FirebaseFirestore.instance
                      .collection('collection')
                      .doc(collections.docId)
                      .collection('items')
                      .orderBy("createdAt", descending: true)
                      .limit(3)
                      .snapshots(),
                  builder: (context, snapshot) {
                    //データ取得中のローディング
                    if(snapshot.data == null) {
                      return CircularProgressIndicator();}

                    int docsLength = 0; //ドキュメント（アイテム）数を入れる型＆初期値
                    final docs = snapshot.data.docs; //ドキュメント（アイテム）
                     docsLength = docs.length; //ドキュメント（アイテム）数を代入

                    return GestureDetector(
                      onTap: () async {
                        //アイテムページへ画面遷移（コレクションデータも渡す）
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListPage(collections)
                          ),
                        );
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              //アイテム画像表示
                              ref.read(CollectionPageProvider).setImage(docs),
                              //コレクションタイトル表示
                              Text(collections.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              //アイテム数表示
                              Text('$docsLength件の画像',
                                style: const TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                ),
            ).toList(); //リスト型へ

            return GridView.count(
                padding: EdgeInsets.all(8),
                crossAxisCount: 1,
                shrinkWrap: true,
                childAspectRatio: 1.5,
                children: widgets
            );
          }
          ),
    );
  }
}
