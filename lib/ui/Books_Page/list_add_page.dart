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
        title: Text('New Item',
        style: TextStyle(
        fontSize: 18,
        ),
        ),
        backgroundColor:Color.fromRGBO(150, 186, 255, 100),
      ),
      body: Container(
        // 余白を付ける
        padding: EdgeInsets.all(25),
        child: Column(
          children: <Widget>[
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
                // データが変更したことを知らせる（画面を更新する）
                setState(() {
                  // データを変更
                  _midashi = value;
                });
              },
            ),
            const SizedBox(height: 8),
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
              width: 100,
              // リスト追加ボタン
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(150, 186, 255, 100),//ボタンの背景色
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
                child: Text('キャンセル',
                style: TextStyle(
                  color: Colors.black38,
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}