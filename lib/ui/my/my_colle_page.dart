import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfirstapp/model/my/my_colle_page_model.dart';
import 'package:myfirstapp/model/setting_model.dart';
import '../../Items.dart';
import 'my_colle_add.dart';
import 'my_list_page.dart';

class CollectionPage extends ConsumerWidget {

  User user;
  CollectionPage(this.user);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: ref.read(colorSetProvider),
            title: Text('My Collection',
              style: TextStyle(fontSize: 18),
            ),
            //コレクション追加画面へ遷移するボタン
            actions: [
              Padding(
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
                      backgroundColor: ref.read(colorSetProvider),
                      content: Text('コレクションを追加しました'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  //コレクション更新
                  await ref.read(CollectionPageProvider).fetchData(user);
                 }
                ),
              ),
            ],
          ),
          body: FutureBuilder(
            future: ref.read(CollectionPageProvider).fetchData(user),
            builder: (BuildContext context, snapshot,) {

            final List<Items> items = ref.read(CollectionPageProvider).items;
            //もしコレクションのデータがなければ（取得中も含む）ぐるぐるを表示
            if (items == null) {
              return const CircularProgressIndicator();
            }
            //コレクションデータをリスト表示
            final List<Widget> widgets = items.map((items) =>
                GestureDetector(
                  onTap: () async {
                    //それぞれデータを定義
                    //タップしたら画面遷移＋データも渡す
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListPage(items)),
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
                        height: 180, width: 180, fit: BoxFit.cover,)
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
                  padding: EdgeInsets.all(8),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: widgets
              ),
            );
          }
          ),
    );
  }
}
