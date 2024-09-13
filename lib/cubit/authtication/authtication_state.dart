abstract class AuthticationState {}

class AuthticationInitial extends AuthticationState {}

class AuthticationLoading extends AuthticationState {}

class AuthticationSucess extends AuthticationState {
  String message;
  AuthticationSucess({required this.message});
}

class AuthticationError extends AuthticationState {
  String message;
  AuthticationError({required this.message});
}
