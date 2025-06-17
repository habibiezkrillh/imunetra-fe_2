import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/models/auth/login_model.dart';
import 'package:front_end/services/auth_service.dart'; // Gunakan AuthService yang sama

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService _authService;

  LoginBloc({AuthService? authService})
      : _authService = authService ?? AuthService(),
        super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<PasswordVisibilityChanged>(_onPasswordVisibilityChanged);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      // Gunakan AuthService untuk login tenaga medis
      final response = await _authService.loginTenagaMedis(
        email: event.loginData.email,
        kataSandi: event.loginData.kataSandi,
      );
      
      print('Login Success Response: $response'); // Untuk debugging
      emit(LoginSuccess(userData: response['data']));
    } catch (e) {
      print('Login Error: $e'); // Untuk debugging
      emit(LoginFailure(error: e.toString()));
    }
  }

  void _onPasswordVisibilityChanged(
    PasswordVisibilityChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(PasswordVisibilityChangedState(obscure: event.obscure));
  }
}