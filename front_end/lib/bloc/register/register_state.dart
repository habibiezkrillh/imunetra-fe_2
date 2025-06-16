part of 'register_bloc.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String error;

  RegisterFailure({required this.error});
}

class RegisterDateUpdated extends RegisterState {
  final DateTime date;

  RegisterDateUpdated({required this.date});
}

class RegisterTermsUpdated extends RegisterState {
  final bool accepted;

  RegisterTermsUpdated({required this.accepted});
}