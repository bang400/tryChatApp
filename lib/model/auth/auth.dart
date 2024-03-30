import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class Auth {

  final FirebaseAuth _auth;

  Auth({FirebaseAuth? firebaseAuth}) : _auth = firebaseAuth ?? FirebaseAuth.instance;

  Future<void> signInWithEmail(String email, String password) async {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('Firebaseユーザ登録エラー: $e');
      }
    } catch (e) {
      if (kDebugMode) {
        print('エラー: $e');
      }
    }
  }
}
