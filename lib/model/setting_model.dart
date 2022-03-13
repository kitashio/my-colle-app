import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AppbarBackgroundColorProvider = Provider(
      (ref) {
        return Colors.white; }
);

final AppbarProvider = ChangeNotifierProvider(
            (ref) => AppbarController(),
);

class AppbarController extends ChangeNotifier{

        Widget setTitle (text){
                return Text(text,
                style: TextStyle(
                        fontSize: 18,
                        color: Colors.black),
                );
        }

        Color setIconcolor (){
                return Colors.black;
        }
}