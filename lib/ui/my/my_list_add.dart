import 'package:flutter/material.dart';
import 'package:myfirstapp/model/my/my_list_add_model.dart';
import 'package:provider/provider.dart';

class ListAddPage extends StatelessWidget {

  final String docId;

  //コンストラクタでdocId受け取る
  const ListAddPage({
    Key key,
    this.docId,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => ListAddModel(),
    child: Consumer<ListAddModel>(builder: (context, model, child)  {

    return Scaffold(

      appBar: AppBar(
        title: Text('New Item',
        style: TextStyle(fontSize: 18),),
        backgroundColor:Color.fromRGBO(150, 186, 255, 100),
      ),

      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: <Widget>[
            //★
            //アイテムの画像設定
            GestureDetector(
              onTap: () async {
                //タップして画像選択
                await model.pickImage();
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 200, width: 200,
                    child: model.imageFile != null
                        ? Image.file(model.imageFile, fit: BoxFit.cover,)
                        : Container(color: Colors.grey,),
                  ),
                  IconButton(icon: Icon(Icons.add_circle,
                    size: 35,
                    color: Colors.white,),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            //★
            //アイテムのタイトル設定
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(5),
              child: Text('タイトル',
              style: TextStyle(fontSize: 13,),
              textAlign: TextAlign.start,),
            ),
            //タイトルのテキスト入力フォーム
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,),
              ),
              onChanged: (text){
                //入力されたテキストを代入
                model.title = text;
              },
            ),
            const SizedBox(height: 8),
            //★
            // アイテムの説明文設定
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(5),
              child: Text('説明文',
                style: TextStyle(fontSize: 13,),
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
                //入力されたテキストを代入
                model.describe = text;
              },
            ),
            const SizedBox(height: 30),
            //★
            //リスト追加ボタン
            Container(
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(150, 186, 255, 100),//ボタンの背景色
                  ),
                onPressed: () async {
                  try {
                    //Firestoreにdoc追加
                    await model.addItem(docId);
                    //前画面に戻る
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
            const SizedBox(height: 8),
            //★
            //キャンセルボタン
            TextButton(
              onPressed: () {
                // "pop"で前の画面に戻る
                Navigator.of(context).pop();
              },
              child: Text('キャンセル',
                style: TextStyle(color: Colors.black38),
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