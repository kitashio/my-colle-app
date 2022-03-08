import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfirstapp/Items.dart';
import 'package:myfirstapp/model/my/my_list_detail_model.dart';
import 'package:myfirstapp/model/setting_model.dart';
import 'my_list_update.dart';

class ListDetailPage extends ConsumerWidget {

  final Items listitem;

  const ListDetailPage({
    Key key,
    this.listitem
  }) : super(key: key);

    @override
    Widget build(BuildContext context, WidgetRef ref) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: ref.read(colorSetProvider),
            actions: [
              //右上のポップアップメニュー
              PopupMenuButton<int>(
                      icon: Icon(Icons.more_horiz),
                      itemBuilder: (context) =>
                      [
                        PopupMenuItem(
                          child: Text("編集"),
                          value: 0,
                        ),
                        PopupMenuItem(
                          child: Text("削除"),
                          value: 1,
                        ),
                      ],
                      onSelected: (choice) {
                        if (choice == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListUpdatePage()),
                          );
                        }
                        else if (choice == 1) {
                          ref.read(ItemListDetailPageProvider).showAlertDialog(context);
                        }
                      }),
            ],
          ),
          body: Container(
                // 余白を付ける
                padding: EdgeInsets.all(30),
                child: Center(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child:listitem.imgURL  != null
                            ? Image.network(listitem.imgURL)
                            : null,
                      ),
                      const SizedBox(height: 20),
                      Text(listitem.title,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 20),
                      Text(listitem.describe,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      );
    }
  }
