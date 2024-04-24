part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class OnClearData extends AuthEvent {
  const OnClearData();

  @override
  List<Object> get props => [];
}

class OnChangeInputEmail extends AuthEvent {
  final String email;

  const OnChangeInputEmail({required this.email});

  @override
  List<Object> get props => [email];
}

class OnChangeInputPassword extends AuthEvent {
  final String password;

  const OnChangeInputPassword({required this.password});

  @override
  List<Object> get props => [password];
}

class OnChangeInputUsername extends AuthEvent {
  final String username;

  const OnChangeInputUsername({required this.username});

  @override
  List<Object> get props => [username];
}

class OnClickSignIn extends AuthEvent {
  final String email;
  final String password;
  final VoidCallback onSuccess;

  const OnClickSignIn({required this.email, required this.password, required this.onSuccess});

  @override
  List<Object> get props => [email, password];
}

class OnClickSignUp extends AuthEvent {
  final String email;
  final String password;
  final String username;
  final VoidCallback onSuccess;

  const OnClickSignUp({
    required this.email,
    required this.password,
    required this.username,
    required this.onSuccess,
  });

  @override
  List<Object> get props => [email, password];
}

class OnCheckedRemember extends AuthEvent {
  final bool isRemember;

  const OnCheckedRemember({required this.isRemember});

  @override
  List<Object> get props => [isRemember];
}
