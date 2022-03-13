import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'model/setting_model.dart';
import 'top_user_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(child: MyApp()
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'MyCollection',
      theme: ThemeData(
        primaryIconTheme: IconThemeData(color: Colors.indigo),
      ),
      home: TopUserPage(),
    );
  }
}