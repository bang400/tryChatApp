import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/chat/view/chat_page.dart';
import 'pages/home_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  const app = MyApp();
  const scope = ProviderScope(child: app);

  // フレームワークとFlutterエンジンを結びつける接着剤のような役割をする
  WidgetsFlutterBinding.ensureInitialized();
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
    // firebaseユーザーのログイン状態を管理
    final user = FirebaseAuth.instance.currentUser;

    return MaterialApp(
      debugShowCheckedModeBanner: false, // キーボード出してから戻ると出るエラーに対処する
      theme: ThemeData(fontFamily: 'NotoSansJP'),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('tryChatApp'),
        ),
        // 初回インストール時、ログアウト時はホームページへ
        // body: const HomePage(),
        // ログインしていたらチャットページへ
        body: const ChatPage(),
      ),
    );
  }
}
