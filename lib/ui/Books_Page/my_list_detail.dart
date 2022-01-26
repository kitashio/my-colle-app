import 'package:flutter/material.dart';
import 'package:myfirstapp/model/my_list_detail_model.dart';
import 'package:provider/provider.dart';
import 'my_list_update.dart';

class ListDetailPage extends StatelessWidget {
  final String imgURL;
  final String title;
  final String discribe;

  const ListDetailPage({
    Key key,
    this.imgURL,
    this.title,
    this.discribe,
  }) : super(key: key);


    @override
    Widget build(BuildContext context) {
      return ChangeNotifierProvider(
        create: (BuildContext context) => ListDetailPageModel(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(150, 186, 255, 100),
            title: Text('1/20',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            actions: [
              //右上のポップアップメニュー
              Consumer<ListDetailPageModel>(builder: (context, model, child)  {
                  return PopupMenuButton<int>(
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
                          model.showAlertDialog(context);
                        }
                      });
                }
              ),
            ],
          ),
          body: Consumer<ListDetailPageModel>(builder: (context, model, child)  {
              return Container(
                // 余白を付ける
                padding: EdgeInsets.all(30),
                child: Center(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child:imgURL  != null
                            ? Image.network(imgURL)
                            : null,
                      ),
                      const SizedBox(height: 20),
                      Text(title,
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
                      Text(discribe,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,

                        ),
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
