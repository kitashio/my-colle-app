import 'package:flutter/material.dart';

class MypageModel with ChangeNotifier {

  void showAlertDialog (BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text("This is the title"),
          children: [
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: Text("first item"),
            ),
            ElevatedButton(
              child: Text('CANCEL'),
              onPressed: () async {
                await Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

}