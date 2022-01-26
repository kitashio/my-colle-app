import 'package:flutter/material.dart';
import 'package:myfirstapp/model/Others/others_list_page_model.dart';
import 'package:myfirstapp/model/my_list_page_model.dart';
import 'package:myfirstapp/ui/Home_Page/others_list_detail_page.dart';
import 'package:provider/provider.dart';
import '../../Items.dart';

class OthersListPage extends StatelessWidget {

  final String collectionImgURL;
  final String collectionTitle;
  final String collectionDiscribe;

  const OthersListPage({
    Key key,
    this.collectionImgURL,
    this.collectionTitle,
    this.collectionDiscribe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => OthersListPageModel()..fetchData(),
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<OthersListPageModel>(builder: (context, model, child)  {
            return Text(collectionTitle,
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
              child: Text('(2)',
              ),
            ),
          ],
        ),
        body: Consumer<OthersListPageModel>(builder: (context, model, child)  {
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
                          MaterialPageRoute(builder: (context) => OthersListDetailPage(imgURL: _imgURL,title: _title,discribe: _describe,)),
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
