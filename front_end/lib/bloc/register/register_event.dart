part of 'register_bloc.dart';

abstract class RegisterEvent {}

class RegisterSubmitted extends RegisterEvent {
  final RegisterTenagaMedisData registerData; // menggunakan model baru

  RegisterSubmitted(this.registerData);
}

class RegisterDatePicked extends RegisterEvent {
  final DateTime date;

  RegisterDatePicked(this.date);
}

class RegisterTermsChanged extends RegisterEvent {
  final bool accepted;

  RegisterTermsChanged(this.accepted);
}