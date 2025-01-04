import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

User googleUserModelFromJson(String str) => jsonDecode(str);

String googleUserModelToJson(User data) => data.toString();

class UserModel {
  String? userEmail;
  String? password;

  UserModel({required this.userEmail, required this.password});

  factory UserModel.fromJson(Map<String, dynamic> user) {
    return UserModel(
      userEmail: user["userEmail"]?.toString(),
      password: user["password"]?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userEmail": userEmail,
      "password": password,
    };
  }
}
