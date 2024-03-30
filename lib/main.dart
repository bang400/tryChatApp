import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/chat/view/chat_page.dart';
import 'pages/home_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  const app = MyApp();
  const scope = ProviderScope(child: app);

  // Firebase初期化処理
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(scope);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'NotoSansJP'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('tryChatApp'),
        ),        
        // 初回インストール時、ログアウト時はホームページへ
        body: const HomePage(),
        // ログインしていたらチャットページへ
        // body: const ChatPage(),
      ),
    );
  }
}
