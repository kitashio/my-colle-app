import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myfirstapp/Items.dart';
import 'package:myfirstapp/model/Others/others_list_detail_model.dart';
import 'package:myfirstapp/model/my/my_list_detail_model.dart';
import 'package:myfirstapp/model/setting_model.dart';

class OthersListDetailPage extends ConsumerWidget {

  final Items othersListItem;
  const OthersListDetailPage(this.othersListItem);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ref.read(colorSetProvider),
          title: Text('1/20',
            style: TextStyle(
              fontSize: 16,
            ),
          ),

        ),
        body: Consumer(builder: (context, ref, child)  {
          return Container(
            // 余白を付ける
            padding: EdgeInsets.all(30),
            child: Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child:othersListItem.imgURL  != null
                        ? Image.network(othersListItem.imgURL,
                    )
                        : null,
                  ),
                  const SizedBox(height: 20),
                  Text(othersListItem.title,
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
                  Text(othersListItem.describe,
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

    );
  }
}