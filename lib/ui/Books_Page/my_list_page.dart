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
        create: (BuildContext context) => ListPageModel()..fetchData(),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,15,10,0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                           await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ListDetailPage()),
                          );
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
                ),
            ).toList();
            return GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.85, // 高さ
                shrinkWrap: true,
                children: widgets
            );
            }
          ),
          floatingActionButton: Consumer<ListPageModel>(builder: (context, model, child)  {
              return FloatingActionButton(
                // backgroundColor: Color.fromRGBO(150, 186, 255, 100),
                child: Icon(Icons.add),
                onPressed: () async {
                  final bool added = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListAddPage()),
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
          ),
        ),
    );
  }
}
