part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});
}

class PasswordVisibilityChangedState extends LoginState {
  final bool obscure;

  PasswordVisibilityChangedState({required this.obscure});
}