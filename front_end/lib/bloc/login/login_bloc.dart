import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/models/login_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<PasswordVisibilityChanged>(_onPasswordVisibilityChanged);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      // ToDo: Replace with actual API call
      await Future.delayed(const Duration(seconds: 1));

      if (event.loginData.username.isEmpty || event.loginData.password.isEmpty) {
        throw Exception('Username dan password harus diisi');
      }

      emit(LoginSuccess());
    } catch (e) {
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