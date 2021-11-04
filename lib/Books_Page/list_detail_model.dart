import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_update_page.dart';

void main() {
  String s = '編集';
  switch (s) {
    case '編集':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListUpdatePage()),
      );
      break;
    case 'banana':
      print('バナナ');
      break;
    case 'grape':
      print('ぶどう');
      break;
    default:
      print('リンゴ、バナナ、ぶどう以外');
      break;
  }
}