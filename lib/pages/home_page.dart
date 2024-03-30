import 'package:flutter/material.dart';
import 'package:try_chat_app/model/auth/auth.dart';
import 'package:try_chat_app/pages/auth/create_user_page.dart';

// ログイン中→　チャットページへ
// 初回インストール時、ログアウト時点→　ホームページへ
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final firstMessageContainer = Container(
      width: 350,
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 3),
          borderRadius:
              BorderRadius.circular(20.0)), // なぜかデコレーションとcolorを同時に有効にできない
      // color: Colors.amber,
      child: const Text(
        'RiverpodでMVVMも意識しながら\nチャットアプリをつくる',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );

    const packageMessageContainer = Text(
      '使うパッケージたち',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
    );

    const packageMessage2Container = Text(
      'flutter_riverpod,\nflutter_hooks,\nbuild_runner,\nriverpod_annotation,\nriverpod_generator',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );

    // ログインボタン
    final signInButton = ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            //double.infinityは自動調節
            // double.infinity使ってエラーがでたらExpandedで囲む
            // minimumSize: const Size(200, double.infinity)),
            minimumSize: const Size(200, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        child: const Text(
          'ログイン',
          style: TextStyle(fontSize: 20),
        ));

    // 新規登録ボタン
    final createButton = ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const CreateUserPage();
          }));
        },
        // style: ElevatedButton.styleFrom(minimumSize: const Size(200, double.infinity)),
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        child: const Text(
          '新規登録',
          style: TextStyle(fontSize: 20),
        ));

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          firstMessageContainer,
          const SizedBox(
            height: 50.0,
          ),
          packageMessageContainer,
          const SizedBox(
            height: 10.0,
          ),
          packageMessage2Container,
          const SizedBox(
            height: 50.0,
          ),
          signInButton,
          const SizedBox(
            height: 20.0,
          ),
          createButton,
        ],
      ),
    );
  }
}
