import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'list_add_page.dart';
import 'list_detail.page.dart';

class MyListPage extends StatefulWidget {

  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My辞書'),
      ),
      body: Container(
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text('泥中の蓮'),
              ),

            ),
            Card(
              child: ListTile(
                title: Text('座右の銘'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListDetailPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListAddPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}