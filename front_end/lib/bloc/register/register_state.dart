// lib/features/auth/bloc/register_state.dart
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

class RegisterFileUpdated extends RegisterState {
  final String filename;

  RegisterFileUpdated({required this.filename});
}

class RegisterTermsUpdated extends RegisterState {
  final bool accepted;

  RegisterTermsUpdated({required this.accepted});
}