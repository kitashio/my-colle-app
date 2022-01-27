import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyaccountModel with ChangeNotifier {

  Future _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Use camera?'),
          content: Text('Description goes here.'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('CANCEL'),
              onPressed: (){

              },
            ),
          ],
        );
      },
    );
  }

}