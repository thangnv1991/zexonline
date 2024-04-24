part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final PageState status;
  final String username;
  final String email;
  final String validEmail;
  final String password;
  final String validPassword;
  final bool isRemember;
  final String error;

  const AuthState({
    required this.status,
    required this.error,
    required this.username,
    required this.email,
    required this.validEmail,
    required this.password,
    required this.validPassword,
    this.isRemember = false,
  });

  AuthState copyWith(
      {PageState? status,
      String? username,
      String? email,
      String? password,
      String? error,
      String? validEmail,
      String? validPassword,
      bool? isRemember}) {
    return AuthState(
        username: username ?? this.username,
        status: status ?? this.status,
        email: email ?? this.email,
        password: password ?? this.password,
        error: error ?? this.error,
        validEmail: validEmail ?? this.validEmail,
        validPassword: validPassword ?? this.validPassword,
        isRemember: isRemember ?? this.isRemember);
  }

  @override
  List<Object?> get props =>
      [username, email, password, status, error, validEmail, validPassword, isRemember];
}
