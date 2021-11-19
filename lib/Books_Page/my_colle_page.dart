import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'my_colle_add.dart';
import 'my_list_page.dart';

//　【My】1.コレクション一覧画面
class MyBookPage extends StatefulWidget {

  @override
  _MyBookPageState createState() => _MyBookPageState();
}

class _MyBookPageState extends State<MyBookPage> {
  String colletitle = '花';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:Color.fromRGBO(150, 186, 255, 100),
        title: Text('My Collction',
        style: TextStyle(
          fontSize: 18,
        ),
        ),
        //　□　コレクション追加画面へ遷移
        actions: [
          IconButton(icon: Icon(Icons.add,),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ColleAddPage()),
                );
          })
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0, // 縦
        mainAxisSpacing: 10.0, // 横
        shrinkWrap: true,
        padding: EdgeInsets.all(10),
        children: List.generate(3, (index) {
          return Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyListPage()),
                  );
                },
                child: Stack(
                  alignment: Alignment.center,
                  children:[
                    Container(
                      child: Image.asset('assets/image/IMG_6426.JPG',
                        height: 170,
                        width: 170,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(colletitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
