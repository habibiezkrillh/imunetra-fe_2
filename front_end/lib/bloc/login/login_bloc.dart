import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/models/auth/login_model.dart';
import 'package:front_end/services/auth/login_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginService loginService;

  LoginBloc({required this.loginService}) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<PasswordVisibilityChanged>(_onPasswordVisibilityChanged);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      // Gunakan service untuk login
      await loginService.login(event.loginData);
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