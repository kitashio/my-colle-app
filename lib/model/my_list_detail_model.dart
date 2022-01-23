import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Items.dart';

class ListDetailPageModel with ChangeNotifier {
  String imgURL;

  Future fetchData () async {
    //コレクションを取得
    final DocumentSnapshot document =  await FirebaseFirestore.instance
        .collection('collection')
        .doc('wIWA9jDdrDu2Iljs69gB')
        .collection('a')
        .doc('9zGOnqL1pGP6Xgi4obV4')
        .get();

    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    final String imgURL = data['imgURL'];
    this.imgURL = imgURL;

    notifyListeners();
  }

  String _label;

  _useCamera (BuildContext context, bool b) {
      _label = '削除しますか？' + (b ? 'はい' : 'いいえ');
      notifyListeners();
      Navigator.pop(context);
  }

  Future showAlertDialog (BuildContext context) {

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

  }//_showAlertDialog

}