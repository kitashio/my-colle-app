import 'package:flutter/material.dart';
import 'package:myfirstapp/model/Others/others_list_detail_model.dart';
import 'package:myfirstapp/model/my_list_detail_model.dart';
import 'package:provider/provider.dart';

class OthersListDetailPage extends StatelessWidget {
  final String imgURL;
  final String title;
  final String discribe;

  const OthersListDetailPage({
    Key key,
    this.imgURL,
    this.title,
    this.discribe,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => OthersListDetailPageModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(150, 186, 255, 100),
          title: Text('1/20',
            style: TextStyle(
              fontSize: 16,
            ),
          ),

        ),
        body: Consumer<OthersListDetailPageModel>(builder: (context, model, child)  {
          return Container(
            // 余白を付ける
            padding: EdgeInsets.all(30),
            child: Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child:imgURL  != null
                        ? Image.network(imgURL,
                      height: 250,
                      width: 250,
                      fit: BoxFit.cover,
                    )
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