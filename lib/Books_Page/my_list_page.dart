import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'list_add_page.dart';
import 'my_list_detail.dart';

class MyListPage extends StatefulWidget {

  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("collection's title",
        style: TextStyle(
          fontSize: 18,
        ),
        ),
        backgroundColor:Color.fromRGBO(150, 186, 255, 100),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0, // 縦
        mainAxisSpacing: 10.0, // 横
        childAspectRatio: 0.87, // 高さ
        shrinkWrap: true,
        padding: EdgeInsets.all(10),
        children: List.generate(100, (index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                // new BoxShadow(
                //   color: Colors.grey,
                //   blurRadius: 10,
                // ),
              ],
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListDetailPage()),
                    );
                  },
                  child: Image.asset('assets/image/IMG_6426.JPG',
                  height: 170,
                  width: 170,
                  fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: Text(''),
                ),
              ],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(150, 186, 255, 100),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListAddPage(),
              fullscreenDialog: true,),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}