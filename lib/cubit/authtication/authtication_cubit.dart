import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/cubit/authtication/authtication_state.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/services/firebase_auth_service.dart';
import 'package:flutter_application_1/utils/common/common_method.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthticationCubit extends Cubit<AuthticationState> {
  AuthticationCubit() : super(AuthticationInitial());

// Login Cubit
  Future<void> Login({required UserModel user}) async {
    emit(AuthticationLoading());
    try {
      String? response = await FirebaseAuthService.instance.login(
        email: user.userEmail,
        password: user.password,
      );
      if (response == "Success") {
        emit(AuthticationSucess(message: response!, emailuser: user));
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
        emit(AuthticationSucess(message: response!, emailuser: user));
      } else {
        emit(AuthticationError(message: response!));
      }
    } catch (e, s) {
      String? message = exceptionHandling(e, s);
      emit(AuthticationError(message: message ?? "Something Wents Wrong"));
    }
  }

  // google sign in method
  Future<void> signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    emit(AuthticationLoading());
    try {
      final GoogleSignInAccount? gacoount = await _googleSignIn.signIn();

      if (gacoount != null) {
        final GoogleSignInAuthentication gAuth = await gacoount.authentication;
        final cread = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken,
          idToken: gAuth.idToken,
        );
        UserCredential user =
            await FirebaseAuth.instance.signInWithCredential(cread);

        if (user.user != null) {
          emit(GoogleSignInSuccess(user: user.user!));
        } else {
          emit(AuthticationError(message: "User Data not found"));
        }
      } else {
        emit(AuthticationError(message: "Sign-in canceled"));
      }
    } catch (e, s) {
      String? mes = exceptionHandling(e, s);
      debugPrintLocal('aaa ****  signInWithGoogle ***** $mes');
      emit(AuthticationError(message: "Failed to sign in: $e"));
    }
  }

  //sign out
  Future<void> signOut() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      await _googleSignIn.signOut();
      emit(AuthticationSucess(message: "Logout succes"));
    } catch (e) {
      emit(AuthticationError(message: "Failed to sign out: $e"));
    }
  }
}
