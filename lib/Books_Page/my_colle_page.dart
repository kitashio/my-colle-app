import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'my_colle_add.dart';
import 'my_list_page.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';


class MyBookPage extends StatefulWidget {

  @override
  _MyBookPageState createState() => _MyBookPageState();
}

class _MyBookPageState extends State<MyBookPage> {

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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: Container(
          child: Row(
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
                  children:[ Container(
                    width: 180,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Image.asset('assets/image/book.png'),
                  ),
                        Text('語彙',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  ],
                ),
              ),
          ],
          ),
        ),
      ),
    );
  }
}
