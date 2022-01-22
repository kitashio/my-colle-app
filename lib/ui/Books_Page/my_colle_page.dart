import 'package:flutter/material.dart';
import 'package:myfirstapp/model/my_colle_page_model.dart';
import '../../Items.dart';
import 'my_colle_add.dart';
import 'package:provider/provider.dart';
import 'my_list_page.dart';

//　【My】1.コレクション一覧画面
class CollectionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => CollectionPageModel()..fetchData(),
    child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor:Color.fromRGBO(150, 186, 255, 100),
            title: Text('My Collection',
            style: TextStyle(
              fontSize: 18,
            ),
            ),
            //　□　コレクション追加画面へ遷移
            actions: [
              Consumer<CollectionPageModel>(builder: (context, model, child)  {
                  return IconButton(icon: Icon(Icons.add, size: 30,),
                  onPressed: () async {
                    final bool added = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ColleAddPage()),
                    );

                    if (added != null && added) {
                      final snackBar = SnackBar(
                        backgroundColor: Colors.blue,
                        content: Text('コレクションを追加しました'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    await model.fetchData();
                   }
                  );
                }
              )
            ],
          ),
          body: Consumer<CollectionPageModel>(builder: (context, model, child)  {
            final List<Items> items = model.items;

            if (items == null) {
              return const CircularProgressIndicator();
            }

            final List<Widget> widgets = items
                .map((items) =>
                GestureDetector(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListPage()),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children:[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: items.imgURL != null
                        ? Image.network(items.imgURL,
                        height: 170,
                        width: 170,
                          fit: BoxFit.cover,)
                        : null,
                      ),
                      Text(items.title??'title',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
            ).toList();
            return GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                padding: const EdgeInsets.all(9),
                children: widgets
            );
          }
          ),
        ),
    );
  }
}
