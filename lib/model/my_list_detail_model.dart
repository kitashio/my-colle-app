import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Items.dart';

class ListDetailPageModel with ChangeNotifier {
  String itemtitle = "僕";
  String _label;

  List<Items> items;

  Future fetchData () async {
    //コレクションを取得
    final QuerySnapshot snapshot =  await FirebaseFirestore.instance
        .collection('collection')
        .doc('wIWA9jDdrDu2Iljs69gB')
        .collection('a')
        .get();

    final List<Items> items = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String title = data['title'];
      final String describe = data['describe'];
      final String imgURL = data['imgURL'];
      return Items(title, describe, imgURL);
    }).toList();

    this.items = items;
    notifyListeners();
  }

  _useCamera (BuildContext context, bool b) {
      _label = '削除しますか？' + (b ? 'はい' : 'いいえ');
      notifyListeners();
      Navigator.pop(context);
  }
  Future _showAlertDialog (BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('削除'),
            content: Text('本当に削除しますか？'),
            actions: <Widget>[
              ElevatedButton(
                child: Text('いいえ'),
                onPressed: () => _useCamera(context, false),
              ),
              ElevatedButton(
                child: Text('はい'),
                onPressed: () => _useCamera(context, true),
              ),
            ]
        );
      },
    );
  }

}