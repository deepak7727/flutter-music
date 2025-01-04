import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String userEmail;
  String password;

  UserModel({required this.userEmail, required this.password});

  factory UserModel.fromJson(Map<String, dynamic> user) {
    return UserModel(userEmail: user["userEmail"], password: user["password"]);
  }

  Map<String, dynamic> toJson(){
    return {
      "userEmail" : userEmail,
      "password" : password,
    };
  }
}