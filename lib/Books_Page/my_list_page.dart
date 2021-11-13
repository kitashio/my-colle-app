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
        padding: EdgeInsets.all(10),
        children: List.generate(100, (index) {
          return Container(
            height: 300,
            // color: Colors.indigo,
            child: Column(
              children: [
                Image.asset('assets/image/IMG_6426.JPG',
                height: 170,
                width: 170,
                fit: BoxFit.cover,
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