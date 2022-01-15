import 'package:flutter/material.dart';
import 'package:myfirstapp/model/my_list_add_model.dart';
import 'package:provider/provider.dart';

class ListAddPage extends StatelessWidget {

  String _midashi = '';
  String _yomi = '';
  String _imi = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => ListAddModel(),
    child: Consumer<ListAddModel>(builder: (context, model, child)  {
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
            GestureDetector(
              onTap: () async {
                await model.pickImage();
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: model.imageFile != null
                        ? Image.file(model.imageFile, fit: BoxFit.cover,)
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
              onChanged: (text){
                model.title = text;
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
                onChanged: (text){
                  model.describe = text;
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
                onPressed: () async {
                  try {
                    await model.addItem();
                    Navigator.of(context).pop(true);
                  } catch (e) {
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
    ),
    );
  }
}