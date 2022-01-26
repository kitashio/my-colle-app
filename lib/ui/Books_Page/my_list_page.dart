import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/model/my_list_page_model.dart';
import 'package:provider/provider.dart';
import '../../Items.dart';
import 'list_add_page.dart';
import 'my_list_detail.dart';

class ListPage extends StatelessWidget {

  final String collectionTitle;
  final String collectionDiscribe;
  final String docId;

  const ListPage({
    Key key,
    this.collectionTitle,
    this.collectionDiscribe,
    this.docId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => ListPageModel(docId: docId)..fetchData(),
    child: Scaffold(
          appBar: AppBar(
            title: Consumer<ListPageModel>(builder: (context, model, child)  {
                model.countDocuments();
                return Text(collectionTitle+' (${model.docC})',
                style: TextStyle(
                  fontSize: 18,
                ),
                );
              }
            ),
            backgroundColor:Color.fromRGBO(150, 186, 255, 100),
            actions: [
              Consumer<ListPageModel>(builder: (context, model, child)  {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                  child: IconButton(icon: Icon(Icons.add_box_outlined, size: 35,),
                      onPressed: () async {
                        final _docId = docId;
                        final bool added = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListAddPage(docId: _docId,)),
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
                  ),
                );
              }
              )
            ],
          ),
          body: Consumer<ListPageModel>(builder: (context, model, child)  {
            final List<Items> items = model.items;

            if (items == null) {
              return const CircularProgressIndicator();
            }

            final List<Widget> widgets = items
                .map((items) =>
                Container(
                  padding: const EdgeInsets.fromLTRB(5,15,5,0),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: items.imgURL != null
                              ? Image.network(items.imgURL,
                            height: 170,
                            width: 170,
                            fit: BoxFit.cover,
                          )
                              : null,
                        ),
                        onTap: () async {
                          final String _imgURL = items.imgURL;
                          final String _title = items.title;
                          final String _describe = items.describe;
                          await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ListDetailPage(imgURL: _imgURL,title: _title,discribe: _describe,)),
                          );
                        },
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(items.title??'title',),//●タイトルが長過ぎた時の改行せずに・・・にする
                      ),
                    ],
                  ),
                ),
            ).toList();
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(collectionDiscribe,),
                    GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 0.82, // 高さ
                        shrinkWrap: true,
                        children: widgets
                    ),
                  ],
                ),
              ),
            );
            }
          ),
        ),
    );
  }
}
