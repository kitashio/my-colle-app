import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Top_Page/top_user_page.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My辞書',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
    ),
      home: TopUserPage(),
    );
  }
}