import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfirstapp/model/Others/others_list_page_model.dart';
import 'package:myfirstapp/ui/others/others_list_detail_page.dart';
import '../../Items.dart';

class OthersListPage extends ConsumerWidget {

  final Items othersCollectionItem;

  const OthersListPage(
    this.othersCollectionItem) ;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(othersCollectionItem.title + ' (2)',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          backgroundColor:Color.fromRGBO(150, 186, 255, 100),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.favorite_border,size: 25,),),
            ),
          ],
        ),
        body: Consumer(builder: (context, ref, child)  {
          final List<Items> othersListItems = ref.read(OthersListPageProvider).othersListItems;

          if (othersListItems == null) {
            return const CircularProgressIndicator();
          }

          final List<Widget> widgets = othersListItems
              .map((othersListItems) =>
              Column(
                children: [
                  GestureDetector(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: othersListItems.imgURL != null
                          ? Image.network(othersListItems.imgURL,
                        height: 180,
                        width: 180,
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OthersListDetailPage(othersListItems)),
                      );
                    },
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(othersListItems.title??'title',),//●タイトルが長過ぎた時の改行せずに・・・にする
                  ),
                ],
              ),
          ).toList();
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(othersCollectionItem.describe,),
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
    );
  }
}