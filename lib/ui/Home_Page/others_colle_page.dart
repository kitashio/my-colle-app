import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/Items.dart';
import 'package:myfirstapp/model/Others/others_colle_page_model.dart';
import 'package:myfirstapp/ui/Home_Page/others_list_page.dart';
import 'package:provider/provider.dart';

class OthersCollectionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (BuildContext context) => OthersCollectionPageModel()..fetchData(),
    child: Scaffold(
      appBar: AppBar(
        title: Text('Others Collection',
        style: TextStyle(
          fontSize: 18,
        ),),
        automaticallyImplyLeading: false,
        backgroundColor:Color.fromRGBO(150, 186, 255, 100),
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
                final String _imgURL = items.imgURL;
                final String _title = items.title;
                final String _describe = items.describe;
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OthersListPage(collectionImgURL: _imgURL,collectionTitle: _title,collectionDiscribe: _describe,)),
                );
              },
              child: Stack(
                alignment: Alignment.center,
                children:[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
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
                  )
                ],
              ),
            ),
        ).toList();
        return SingleChildScrollView(
          child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              padding: const EdgeInsets.all(9),
              children: widgets
          ),
        );
      }
      ),
    ),
    );
  }
}
