import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/utils/common/common_method.dart';

class FirebaseAuthService {
  static final FirebaseAuthService instance = FirebaseAuthService._();
  factory FirebaseAuthService() => instance;
  FirebaseAuthService._();

  Future<void> initalization() async {
    debugPrintLocal('****** FirebaseInitalize  *****');
    if (Platform.isIOS) {
      await Firebase.initializeApp();
    } else {
      await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAxm08bUVExh0fiIJkgu80tn_8BMvyEjk0",
            appId: "1:129106982339:android:dc59a2573699fe9bef3976",
            messagingSenderId: "129106982339",
            projectId: "music-player-dc42f"),
      );
    }
  }

// Firebase User Registration
  Future<String?> registration({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

// Firebase User Login
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
