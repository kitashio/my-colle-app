import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfirstapp/model/my/my_list_page_model.dart';
import 'package:myfirstapp/model/setting_model.dart';
import '../../Items.dart';
import 'my_list_add.dart';
import 'my_list_detail.dart';

class ListPage extends ConsumerWidget {
  ListPage(this.collectionitem);
  final Items collectionitem;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final String collectionDocId = collectionitem.docId;

    return Scaffold(
          appBar: AppBar(
            title: Text(collectionitem.title + ' (${ref.read(ItemListPageProvider).listDocLength})',
                style: TextStyle(
                  fontSize: 18,
                ),
                ),
            backgroundColor: ref.read(colorSetProvider),
            actions: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                  child: IconButton(icon: Icon(Icons.add, size: 35,),
                  onPressed: () async {
                        final bool added = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListAddPage(collectionDocId)),
                        );
                        if (added != null && added) {
                          final snackBar = SnackBar(
                            backgroundColor: Colors.blue,
                            content: Text('コレクションを追加しました'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        await ref.read(ItemListPageProvider).fetchData(collectionDocId);
                      }
                  ),
                ),
            ],
          ),
          body: FutureBuilder(
              future: ref.read(ItemListPageProvider).fetchData(collectionDocId),
              builder: (BuildContext context, snapshot,) {

            final List<Items> listitems = ref.read(ItemListPageProvider).listitems;

            if (listitems == null) {
              return const CircularProgressIndicator();
            }

            final List<Widget> widgets = listitems
                .map((listitems) =>
                Column(
                  children: [
                    GestureDetector(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: listitems.imgURL != null
                            ? Image.network(listitems.imgURL,
                          height: 180,
                          width: 180,
                          fit: BoxFit.cover,
                        )
                            : null,
                      ),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListDetailPage(listitem: listitems,)),
                        );
                      },
                    ),
                    Text(listitems.title??'title',),
                  ],
                ),
            ).toList();
            return SingleChildScrollView(
              child: Column(
                children: [
                  Text('uid:  '+ collectionitem.uid),
                  Text(collectionitem.describe,),
                  GridView.count(
                      padding: EdgeInsets.all(8),
                      crossAxisCount: 2,
                      childAspectRatio: 0.88, // 高さ
                      shrinkWrap: true,
                      children: widgets
                  ),
                ],
              ),
            );
            }
          ),
    );
  }
}
