import 'package:flutter/material.dart';
import 'package:myfirstapp/model/Others/others_colle_page_model.dart';
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
          actions: [
            Consumer<OthersCollectionPageModel>(builder: (context, model, child)  {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: IconButton(icon: Icon(Icons.search, size: 30),
                  onPressed: (){},
                ),
              );
            }
            )
          ],
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
                child: Column(
                  children: [
                    Stack(
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
                        ),
                        Positioned(
                          left: 100.0,
                          top: 100.0,
                          width: 100.0,
                          height: 100.0,
                          child: IconButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {

                            },
                            icon: Icon(Icons.favorite_border,
                              size: 25,
                            color: Colors.white,),),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('user'),
                      ],
                    ),
                  ],
                ),
              ),
          ).toList();
          return SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                children: widgets
            ),
          );
         }
        ),
      ),
    );
  }
}
