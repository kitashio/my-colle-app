import 'package:flutter/material.dart';
import 'package:myfirstapp/model/my_list_page_model.dart';
import 'package:provider/provider.dart';
import '../../Items.dart';
import 'list_add_page.dart';
import 'my_list_detail.dart';

class ListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => ListPageModel(),
    child: Scaffold(
          appBar: AppBar(
            title: Consumer<ListPageModel>(builder: (context, model, child)  {
                return Text(model.itemtitle,
                style: TextStyle(
                  fontSize: 18,
                ),
                );
              }
            ),
            backgroundColor:Color.fromRGBO(150, 186, 255, 100),
            actions: [
              Container(
                // color: Colors.white,
                padding: EdgeInsets.fromLTRB(0, 20, 10, 0),
                  child: Text('(20)',
                  ),
              ),
            ],
          ),
          body: Consumer<ListPageModel>(builder: (context, model, child)  {
            final List<Items> items = model.items;

            if (items == null) {
              return const CircularProgressIndicator();
            }

            final List<Widget> widgets = items
                .map((items) =>
                Column(
                  children: [
                    GestureDetector(
                      onTap: ()  {
                        // await Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => ListDetailPage()),
                        // );
                      },
                      child: items.imgURL != null
                          ? Image.network(items.imgURL,
                        height: 170,
                        width: 170,
                        fit: BoxFit.cover,)
                          : null,
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Text(items.title??'title',),//●タイトルが長過ぎた時の改行せずに・・・にする
                    ),
                  ],
                ),
            ).toList();
            return GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0, // 縦
                mainAxisSpacing: 10.0, // 横
                childAspectRatio: 0.86, // 高さ
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                children: widgets
            );
            }
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
        ),
    );
  }
}

// return GridView.count(
// crossAxisCount: 2,
// crossAxisSpacing: 10.0, // 縦
// mainAxisSpacing: 10.0, // 横
// childAspectRatio: 0.86, // 高さ
// shrinkWrap: true,
// padding: EdgeInsets.all(10),
// children: List.generate(20, (index) {
// return Column(
// children: [
// GestureDetector(
// onTap: (){},
// child: Image.asset('assets/image/IMG_6426.JPG',
// height: 170,
// width: 170,
// fit: BoxFit.cover,
// ),
// ),
// Container(
// margin: EdgeInsets.all(8),
// child: Text(model.itemtitle),//●タイトルが長過ぎた時の改行せずに・・・にする
// ),
// ],
// );
// }),
// );

// Stack(
// children:[
// items.imgURL != null
// ? Image.network(items.imgURL,
// height: 170,
// width: 170,
// fit: BoxFit.cover,)
// : null,
// Text(items.title??'title',
// textAlign: TextAlign.center,
// style: const TextStyle(
// color: Colors.white,
// fontSize: 18,
// letterSpacing: 2,
// fontWeight: FontWeight.bold,
// ),
// )
// ],
// ),