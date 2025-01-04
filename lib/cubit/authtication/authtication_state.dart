import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/models/user_model.dart';

abstract class AuthticationState {}

class AuthticationInitial extends AuthticationState {}

class AuthticationLoading extends AuthticationState {}

class AuthticationSucess extends AuthticationState {
  String message;
  UserModel? emailuser;
  AuthticationSucess({
    required this.message,
    this.emailuser,
  });
}

class GoogleSignInSuccess extends AuthticationState {
  final User user;

  GoogleSignInSuccess({required this.user});
}

class AuthticationError extends AuthticationState {
  String message;
  AuthticationError({required this.message});
}
