import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/model/Others/others_colle_page_model.dart';
import 'package:myfirstapp/model/my/my_colle_page_model.dart';
import 'package:myfirstapp/ui/others/others_list_page.dart';
import '../../Items.dart';
import 'package:provider/provider.dart';

//　【My】1.コレクション一覧画面
class OthersCollectionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => OthersCollectionPageModel()..fetchData(),
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
        ),
        body: Consumer<OthersCollectionPageModel>(builder: (context, model, child)  {
          final List<Items> items = model.items;

          if (items == null) {
            return const CircularProgressIndicator();
          }

          final List<Widget> widgets = items
              .map((items) =>
              GestureDetector(
                onTap: () async {
                  final String _docId = items.docId;
                  final String _title = items.title;
                  final String _describe = items.describe;
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OthersListPage(collectionTitle: _title,collectionDiscribe: _describe,docId: _docId)),
                  );
                },
                child: Stack(
                  alignment: Alignment.center,
                  children:[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
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
          return SingleChildScrollView(
            child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                children: widgets
            ),
          );
        }
        ),
      ),
    );
  }
}
