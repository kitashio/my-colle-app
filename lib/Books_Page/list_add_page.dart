import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListAddPage extends StatefulWidget {

  @override
  _ListAddPageState createState() => _ListAddPageState();
}

class _ListAddPageState extends State<ListAddPage> {
  String _midashi = '';
  String _yomi = '';
  String _imi = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新規登録'),
      ),
      body: Container(
        // 余白を付ける
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 8),
            // テキスト入力
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(5),
              child: Text('見出し語',
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
                // データが変更したことを知らせる（画面を更新する）
                setState(() {
                  // データを変更
                  _midashi = value;
                });
              },
            ),
            const SizedBox(height: 10),
            // テキスト入力
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(5),
              child: Text('読み',
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
                // データが変更したことを知らせる（画面を更新する）
                setState(() {
                  // データを変更
                  _yomi = value;
                });
              },
            ),
            const SizedBox(height: 8),
            // テキスト入力
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(5),
              child: Text('意味（本文）',
                style: TextStyle(
                  fontSize: 13,
                ),
                textAlign: TextAlign.start,),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )
                ),
                onChanged: (String value){
                  // データが変更したことを知らせる（画面を更新する）
                  setState(() {
                    // データを変更
                    _imi = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 30),
            Container(
              // 横幅いっぱいに広げる
              width: double.infinity,
              // リスト追加ボタン
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan, //ボタンの背景色
                ),
                onPressed: () {},
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}