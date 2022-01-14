import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/my_colle_add_model.dart';

//　【My】2.コレクション追加画面
class ColleAddPage extends StatelessWidget {

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
          return Padding(
            padding: const EdgeInsets.all(20.0),
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
                const SizedBox(height: 20),
                // タイトル入力
                TextField(
                  decoration: InputDecoration(
                      labelText: 'コレクションタイトル',
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
                const SizedBox(height: 25),
                // 説明文入力
                TextField(
                  maxLines: 6,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      labelText: '説明',
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
                const SizedBox(height: 30),
                Container(
                  // 横幅いっぱいに広げる
                  width: 100,
                  // リスト追加ボタン
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(150, 186, 255, 100), //ボタンの背景色
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