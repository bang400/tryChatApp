import 'package:flutter/material.dart';
import 'view/home_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // 一旦DBをリセットする
    // resetDB();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "tryChatApp",
      home: HomePage(),
    );
  }
}