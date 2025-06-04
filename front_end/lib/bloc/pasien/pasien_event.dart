import 'package:equatable/equatable.dart';

abstract class PasienEvent extends Equatable {
  const PasienEvent();

  @override
  List<Object?> get props => [];
}

class LoadPasienList extends PasienEvent {}
