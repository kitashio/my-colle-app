import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_colle_add_model.dart';

//　【My】2.コレクション追加画面
class ColleAddPage extends StatelessWidget {

  String _midashi = '';
  String _yomi = '';
  String _imi = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => CollectionAddModel(),
    child: Scaffold(
      appBar: AppBar(
        title: Text('New Collection',
        style: TextStyle(
        fontSize: 18,
        ),
        ),
        backgroundColor:Color.fromRGBO(150, 186, 255, 100),
      ),
      body: Consumer<CollectionAddModel>(builder: (context, model,child) {
          return Container(
            // 余白を付ける
            padding: EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                Text('サムネイル画像'),
                const SizedBox(height: 8),
                Container(
                child: Image.asset('assets/image/IMG_6426.JPG',
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                ),
                const SizedBox(height: 8),
                // テキスト入力
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(5),
                  child: Text('タイトル',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.start,),
                ),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )
                  ),
                  onChanged: (String value){
                    model.title = value;
                  },
                ),
                const SizedBox(height: 10),
                // テキスト入力
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(5),
                  child: Text('説明文',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.start,),
                ),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )
                  ),
                  onChanged: (String value){
                    model.describe = value;
                  },
                ),
                const SizedBox(height: 30),
                Container(
                  // 横幅いっぱいに広げる
                  width: 100,
                  // リスト追加ボタン
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(150, 186, 255, 100), //ボタンの背景色
                    ),
                    onPressed: () {
                      model.SetCollection();
                      Navigator.of(context).pop();
                    },
                    child: Text('登録'),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  // 横幅いっぱいに広げる
                  width: double.infinity,
                  // キャンセルボタン
                  child: TextButton(
                    // ボタンをクリックした時の処理
                    onPressed: () {
                      // "pop"で前の画面に戻る
                      Navigator.of(context).pop();
                    },
                    child: Text('キャンセル'),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    ),
    );
  }
}