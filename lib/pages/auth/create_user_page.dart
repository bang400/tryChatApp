import 'package:flutter/material.dart';

class CreateUserPage extends StatelessWidget {
  const CreateUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Emailフォーム
    final emailTextForm = TextFormField(
      // onUserInteractionはユーザが入力したときにバリデーションを行う
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
      validator: (value) {},
      onChanged: (text) {},
    );

    // パスワードフォーム
    final passwordTextForm = TextFormField(
      // onUserInteractionはユーザが入力したときにバリデーションを行う
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
      validator: (value) {},
      onChanged: (text) {},
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
          passwordTextForm
        ],
      ),
    );
  }
}
