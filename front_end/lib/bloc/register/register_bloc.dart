import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/models/auth/register_model.dart';
import 'package:front_end/services/auth_service.dart'; // Import service baru

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthService _authService; // Tambahkan instance AuthService

  // Inisialisasi bloc dengan AuthService
  RegisterBloc({AuthService? authService})
      : _authService = authService ?? AuthService(), // Gunakan instance yang diberikan atau buat yang baru
        super(RegisterInitial()) {
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
      // Panggil service untuk mendaftar tenaga medis
      final response = await _authService.registerTenagaMedis(event.registerData);
      print('Register Success Response: $response'); // Untuk debugging

      emit(RegisterSuccess());
    } catch (e) {
      print('Register Error: $e'); // Untuk debugging
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