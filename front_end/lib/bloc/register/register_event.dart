part of 'register_bloc.dart';

abstract class RegisterEvent {}

class RegisterSubmitted extends RegisterEvent {
  final RegisterData registerData;

  RegisterSubmitted(this.registerData);
}

class RegisterDatePicked extends RegisterEvent {
  final DateTime date;

  RegisterDatePicked(this.date);
}

class RegisterFilePicked extends RegisterEvent {
  final String filename;

  RegisterFilePicked(this.filename);
}

class RegisterTermsChanged extends RegisterEvent {
  final bool accepted;

  RegisterTermsChanged(this.accepted);
}