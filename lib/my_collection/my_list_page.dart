import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfirstapp/model/setting_model.dart';
import '../model/Items.dart';
import 'my/my_list_add_model.dart';
import 'my/my_list_page_model.dart';
import 'my_list_add.dart';
import 'my_list_detail.dart';

class ListPage extends ConsumerWidget {
  ListPage(this.collectionitem); //コレクションデータを受け取る
  final Items collectionitem;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final String collectionDocId = collectionitem.docId; //コレクションのドキュメントID定義

    return Scaffold(
          appBar: AppBar(
            title: ref.read(AppbarProvider).setTitle(collectionitem.title),
            iconTheme: IconThemeData(color: ref.read(AppbarProvider).setIconcolor(),),
            backgroundColor: Colors.white,
            elevation: 0.0,
            actions: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                  child: IconButton(icon: Icon(Icons.add, size: 35,),
                  onPressed: () async {
                        final bool added = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListAddPage(collectionDocId)),
                        );
                        ref.watch(ItemListAddProvider).imageFile = null;
                        ref.watch(ItemListAddProvider).title = null;
                        ref.watch(ItemListAddProvider).describe = null;
                        if (added != null && added) {
                          final snackBar = SnackBar(
                            backgroundColor: ref.read(AppbarBackgroundColorProvider),
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
              future: ref.watch(ItemListPageProvider).fetchData(collectionDocId),
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
                        borderRadius: BorderRadius.circular(2),
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
            return Column(
              children: [
                Text(collectionitem.describe,),
                GridView.count(
                    padding: EdgeInsets.all(10),
                    crossAxisCount: 2,
                    childAspectRatio: 0.86, // 高さ
                    shrinkWrap: true,
                    children: widgets
                ),
              ],
            );
            }
          ),
    );
  }
}
