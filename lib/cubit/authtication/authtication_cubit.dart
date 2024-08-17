import 'package:flutter_application_1/cubit/authtication/authtication_state.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/services/firebase_auth_service.dart';
import 'package:flutter_application_1/utils/common/common_method.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
}
