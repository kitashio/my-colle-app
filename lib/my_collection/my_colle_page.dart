import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfirstapp/model/setting_model.dart';
import '../model/Items.dart';
import 'my/my_colle_add_model.dart';
import 'my/my_colle_page_model.dart';
import 'my/my_list_page_model.dart';
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
                  ref.watch(CollectionAddPageProvider).imageFile = null;
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
            future: ref.read(CollectionPageProvider).fetchData(user),
            builder: (BuildContext context, snapshot,) {

            final List<Items> collections = ref.read(CollectionPageProvider).collectionItems;

            //もしコレクションのデータがなければ（取得中も含む）ぐるぐるを表示
            if (collections == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            //コレクションデータをリスト表示
            final widgets = collections.map((collections) =>
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('collection')
                      .doc(collections.docId)
                      .collection('items')
                      .orderBy("createdAt", descending: false)
                      .limit(3)
                      .snapshots(),
                  builder: (context, snapshot) {

                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    getItems(AsyncSnapshot<QuerySnapshot> snapshot) {
                      return snapshot.data.docs.map((doc) =>
                          Image.network(doc["imgURL"]),)
                          .toList();
                    }

                    return GestureDetector(
                      onTap: () async {
                        //それぞれデータを定義
                        //タップしたら画面遷移＋データも渡す
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListPage(collections)
                          ),
                        );
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              Row(children: [
                                Image.network(user.photoURL,height: 170,width: 170,fit: BoxFit.cover,),
                                Column(
                                  children: [
                                    Image.network(user.photoURL,height: 85,width: 170,fit: BoxFit.cover,),
                                    Image.network(user.photoURL,height: 85,width: 170,fit: BoxFit.cover,),
                                  ],
                                ),
                              ],),
                              SizedBox(height: 5),
                              //コレクションのタイトル表示
                              Text(collections.title??'title',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('0件の画像',
                                style: const TextStyle(
                                  fontSize: 10,
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
            //グリッドの画面オーバーエラーを防ぐためのスクロールビュー
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
