import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/utils/global/prefes_res.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Globals {
  static final Globals instance = Globals._();
  factory Globals() => instance;
  Globals._();

  bool userLogin = true;
  bool darkMode = false;

  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  User? goolgeUser;
  UserModel? emailUser;

  void changeUser(
      {User? googleuser, UserModel? emailuser, bool write = true}) async {
    final flutterStorage = const FlutterSecureStorage();
    if (write) {
      if (emailuser != null) {
        await flutterStorage.write(
          key: PrefesRes.emailUserInfo,
          value: userModelToJson(emailuser!),
          aOptions: Globals.instance.getAndroidOptions(),
          iOptions: Globals.instance.getIOSOptions(),
        );
      }
      if (googleuser != null) {
        // await flutterStorage.write(
        //   key: PrefesRes.googleUserInfo,
        //   value: userModelToJson(googleuser!),
        //   aOptions: Globals.instance.getAndroidOptions(),
        //   iOptions: Globals.instance.getIOSOptions(),
        // );
      }
    }
  }

  IOSOptions getIOSOptions() => IOSOptions();
}
