import 'package:equatable/equatable.dart';
import '../../models/pasien/pasien_model.dart';

abstract class PasienState extends Equatable {
  const PasienState();

  @override
  List<Object?> get props => [];
}

class PasienInitial extends PasienState {}

class PasienLoading extends PasienState {}

class PasienLoaded extends PasienState {
  final List<PasienModel> pasienList;

  const PasienLoaded(this.pasienList);

  @override
  List<Object?> get props => [pasienList];
}

class PasienError extends PasienState {
  final String message;

  const PasienError(this.message);

  @override
  List<Object?> get props => [message];
}