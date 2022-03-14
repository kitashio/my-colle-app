import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfirstapp/model/setting_model.dart';
import '../model/Items.dart';
import 'Others/others_colle_page_model.dart';
import 'others_list_page.dart';

//　【Others】1.Othersコレクション一覧画面
class OthersCollectionPage extends ConsumerWidget {
  User user;
  OthersCollectionPage(this.user);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: ref.read(AppbarProvider).setTitle('Others collections'),
          iconTheme: IconThemeData(color: ref.read(AppbarProvider).setIconcolor(),),
          automaticallyImplyLeading: false,
          backgroundColor:ref.read(AppbarBackgroundColorProvider),
          elevation: 0.0,
          //　□　コレクション追加画面へ遷移
          actions: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: IconButton(icon: Icon(Icons.search, size: 30),
                  onPressed: (){},
                ),
              ),
          ],
        ),
        body: FutureBuilder(
            future: ref.read(OthersCollectionPageProvider).fetchData(),
            builder: (BuildContext context, snapshot,) {

          final List<Items> othersCollections =
              ref.read(OthersCollectionPageProvider).othersitems;

          if (othersCollections == null) {
            return const CircularProgressIndicator();
          }

          final List<Widget> widgets = othersCollections
              .map((othersCollections) =>
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('collection')
                    .doc(othersCollections.docId)
                    .collection('items')
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
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OthersListPage(othersCollections)),
                      );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //アイテム画像表示
                            ref.read(OthersCollectionPageProvider).setImage(docs),
                            Text(' ' + othersCollections.title,style: TextStyle(fontWeight: FontWeight.bold),),
                            Row(
                              children: [
                                Text(' minn',style: TextStyle(fontSize: 12),),
                                SizedBox(
                                  height: 20.0,
                                  width: 15.0,
                                  child: IconButton(
                                    onPressed: () {
                                    },
                                    alignment: Alignment.bottomRight,
                                    icon: Icon(Icons.favorite_border,
                                      size: 18,
                                      color: Colors.brown,),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              ),
          ).toList();
          return GridView.count(
              padding: EdgeInsets.all(10),
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 0.98,
              children: widgets
          );
         }
        ),
    );
  }
}
