abstract class AuthticationState {}

class AuthticationInitial extends AuthticationState {}

class AuthticationLoading extends AuthticationState {}

class AuthticationSucess extends AuthticationState {
  String message;
  AuthticationSucess({required this.message});
}

class GoogleSignInSuccess extends AuthticationState {
  final String displayName;
  final String email;
  final String photoUrl;

  GoogleSignInSuccess({
    required this.displayName,
    required this.email,
    required this.photoUrl,
  });
}

class AuthticationError extends AuthticationState {
  String message;
  AuthticationError({required this.message});
}
