import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfirstapp/model/setting_model.dart';
import '../model/Items.dart';
import 'Others/others_colle_page_model.dart';
import 'others_list_page.dart';

//　【Others】1.Othersコレクション一覧画面
class OthersCollectionPage extends ConsumerWidget {
  User user;
  OthersCollectionPage(this.user);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: ref.read(AppbarProvider).setTitle('Others collections'),
          iconTheme: IconThemeData(color: ref.read(AppbarProvider).setIconcolor(),),
          automaticallyImplyLeading: false,
          backgroundColor:ref.read(AppbarBackgroundColorProvider),
          elevation: 0.0,
          //　□　コレクション追加画面へ遷移
          actions: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: IconButton(icon: Icon(Icons.search, size: 30),
                  onPressed: (){},
                ),
              ),
          ],
        ),
        body: FutureBuilder(
            future: ref.read(OthersCollectionPageProvider).fetchData(),
            builder: (BuildContext context, snapshot,) {

          final List<Items> othersItems =
              ref.read(OthersCollectionPageProvider).othersitems;

          if (othersItems == null) {
            return const CircularProgressIndicator();
          }

          final List<Widget> widgets = othersItems
              .map((othersItems) =>
              GestureDetector(
                onTap: () async {

                  final aaa =


                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OthersListPage(othersItems)),
                  );
                },
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children:[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: othersItems.imgURL != null
                              ? Image.network(othersItems.imgURL,
                            height: 180,
                            width: 180,
                            fit: BoxFit.cover,)
                              : null,
                        ),
                        Text(othersItems.title??'title',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 3, 0, 0),
                      child: Row(
                        children: [
                          Container(
                            height: 23,
                            width: 23,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage('${ref.read(OthersCollectionPageProvider).getData(othersItems.uid)}'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25.0,
                            width: 25.0,
                            child: IconButton(
                                onPressed: () {
                                },
                                padding: EdgeInsets.fromLTRB(5,0,0,0),
                                icon: Icon(Icons.favorite_border,
                                  size: 25,
                                  color: Colors.brown,),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
          ).toList();
          return GridView.count(
              padding: EdgeInsets.all(8),
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 0.87,
              children: widgets
          );
         }
        ),
    );
  }
}
