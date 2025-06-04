part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final LoginData loginData;

  LoginSubmitted(this.loginData);
}

class PasswordVisibilityChanged extends LoginEvent {
  final bool obscure;

  PasswordVisibilityChanged(this.obscure);
}