import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/utils/global/prefes_res.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class Globals {
  static final Globals instance = Globals._();
  factory Globals() => instance;
  Globals._();

  RxBool userLogin = true.obs;
  RxBool darkMode = false.obs;
  Rxn<User?> goolgeUser = Rxn<User?>();
  Rxn<UserModel?> emailUser = Rxn<UserModel?>();
  final flutterStorage = const FlutterSecureStorage();

  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  IOSOptions getIOSOptions() => IOSOptions();

  Future<void> changeUser({
    User? googleuser,
    UserModel? emailuser,
    bool write = true,
  }) async {
    if (write) {
      if (emailuser != null) {
        await flutterStorage.write(
          key: PrefesRes.emailUserInfo,
          value: userModelToJson(emailuser),
          aOptions: Globals.instance.getAndroidOptions(),
          iOptions: Globals.instance.getIOSOptions(),
        );
      }
      if (googleuser != null) {
        await flutterStorage.write(
          key: PrefesRes.googleUserInfo,
          value: googleUserModelToJson(googleuser),
          aOptions: Globals.instance.getAndroidOptions(),
          iOptions: Globals.instance.getIOSOptions(),
        );
      }
    }
  }

  void logout() {
    Globals.instance.changeUser(emailuser: null, googleuser: null);
  }

  Future<({UserModel? emailUser, User? googleUser})> getUserDetails() async {
    UserModel? emailUserValue;
    User? googleUserValue;
    if (await flutterStorage.containsKey(key: PrefesRes.emailUserInfo)) {
      String? emailUserString =
          await flutterStorage.read(key: PrefesRes.emailUserInfo);
      if (emailUserString != null) {
        emailUserValue = userModelFromJson(emailUserString);
      }
    }
    if (await flutterStorage.containsKey(key: PrefesRes.googleUserInfo)) {
      String? emailUserString =
          await flutterStorage.read(key: PrefesRes.googleUserInfo);
      if (emailUserString != null) {
        googleUserValue = googleUserModelFromJson(emailUserString);
      }
    }
    return (
      emailUser: emailUserValue,
      googleUser: googleUserValue,
    );
  }
}
