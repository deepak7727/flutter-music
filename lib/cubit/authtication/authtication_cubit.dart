import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/cubit/authtication/authtication_state.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/services/firebase_auth_service.dart';
import 'package:flutter_application_1/utils/common/common_method.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthticationCubit extends Cubit<AuthticationState> {
  AuthticationCubit() : super(AuthticationInitial());
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

// Login Cubit
  Future<void> Login({required UserModel user}) async {
    emit(AuthticationLoading());
    try {
      String? response = await FirebaseAuthService.instance.login(
        email: user.userEmail,
        password: user.password,
      );
      if (response == "Success") {
        emit(AuthticationSucess(message: response!));
      } else {
        emit(AuthticationError(message: response!));
      }
    } catch (e, s) {
      String? message = exceptionHandling(e, s);
      emit(AuthticationError(message: message ?? "Something Wents Wrong"));
    }
  }

  // Signup Cubit
  Future<void> Signup({required UserModel user}) async {
    emit(AuthticationLoading());
    try {
      String? response = await FirebaseAuthService.instance.registration(
        email: user.userEmail,
        password: user.password,
      );
      if (response == "Success") {
        emit(AuthticationSucess(message: response!));
      } else {
        emit(AuthticationError(message: response!));
      }
    } catch (e, s) {
      String? message = exceptionHandling(e, s);
      emit(AuthticationError(message: message ?? "Something Wents Wrong"));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(AuthticationLoading());
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null;
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        emit(AuthticationSucess(message: "Success"));
      } else {
        emit(AuthticationError(message: "Failed"));
      }
    } catch (e, s) {
      String? message = exceptionHandling(e, s);
      emit(AuthticationError(message: message ?? "Something Wents Wrong"));
    }
  }

  // Sign outz
  Future<void> signOut() async {
    emit(AuthticationLoading());
    try {
      await googleSignIn.signOut();
      await _auth.signOut();
    } catch (e, s) {
      String? message = exceptionHandling(e, s);
      emit(AuthticationError(message: message ?? "Something Wents Wrong"));
    }
  }
}
