import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'ui/top_user_page.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyCOLLE',
      theme: ThemeData(
        primaryColor: Color(0xFF96baff),
      ),
      home: TopUserPage(),
    );
  }
}