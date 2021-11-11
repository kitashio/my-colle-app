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
      body: Container(
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text('泥中の蓮'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListDetailPage()),
                  );
                },
              ),

            ),
            Card(
              child: ListTile(
                title: Text('座右の銘'),
                onTap: (){
                },
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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