import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../model/auth/auth.dart';

class CreateUserPage extends HookWidget {
  const CreateUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final auth = Auth();

    Future<void> registerWithEmail() async {
      await auth.registerWithEmail(
        emailController.text,
        passwordController.text,
      );
    }

    // Emailフォーム
    final emailTextForm = TextFormField(
      // onUserInteractionはユーザが入力したときにバリデーションを行う
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Emailアドレスを入力してください。';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Email',
        fillColor: Colors.lightBlue[100],
        filled: true,
        isDense: true,
        prefixIcon: const Icon(Icons.mail),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide.none,
        ),
      ),
    );

    // パスワードフォーム
    final passwordTextForm = TextFormField(
      // onUserInteractionはユーザが入力したときにバリデーションを行う
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: passwordController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Passwordを入力してください。';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Password',
        fillColor: Colors.lightBlue[100],
        filled: true,
        isDense: true,
        prefixIcon: const Icon(Icons.key),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide.none,
        ),
      ),
    );

    // 新規ユーザー登録ボタン
    final registerButton = ElevatedButton(
      onPressed: registerWithEmail,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      child: const Text(
        '新規登録',
        style: TextStyle(fontSize: 20),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('新規ユーザ登録'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          emailTextForm,
          const SizedBox(
            height: 10,
          ),
          passwordTextForm,
          const SizedBox(
            height: 20,
          ),
          registerButton
        ],
      ),
    );
  }
}
