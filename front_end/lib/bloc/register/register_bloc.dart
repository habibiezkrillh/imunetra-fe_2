// lib/features/auth/bloc/register_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/models/register_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
    on<RegisterDatePicked>(_onDatePicked);
    on<RegisterFilePicked>(_onFilePicked);
    on<RegisterTermsChanged>(_onTermsChanged);
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());
    try {
      // TODO: Replace with actual API call
      await Future.delayed(const Duration(seconds: 2));
      
      if (event.registerData.email.contains('test')) {
        throw Exception('Email test tidak diperbolehkan');
      }
      
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure(error: e.toString()));
    }
  }

  void _onDatePicked(
    RegisterDatePicked event,
    Emitter<RegisterState> emit,
  ) {
    emit(RegisterDateUpdated(date: event.date));
  }

  void _onFilePicked(
    RegisterFilePicked event,
    Emitter<RegisterState> emit,
  ) {
    emit(RegisterFileUpdated(filename: event.filename));
  }

  void _onTermsChanged(
    RegisterTermsChanged event,
    Emitter<RegisterState> emit,
  ) {
    emit(RegisterTermsUpdated(accepted: event.accepted));
  }
}