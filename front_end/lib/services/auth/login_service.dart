import 'package:front_end/models/auth/login_model.dart';

class LoginService {
    // Simulasi data user yang valid untuk demo
    static const _demoUsername = 'perawat123';
    static const _demoPassword = 'password123';

    // Simulasi waktu delay seperti network request
    static const _simulatedDelay = Duration(seconds: 1);

    Future<bool> login(LoginData loginData) async {
        await Future.delayed(_simulatedDelay);

        // Validasi input kosong
        if (loginData.username.isEmpty || loginData.password.isEmpty) {
            throw Exception('Username dan password harus diisi');
        }

        // Validasi credentials
        if (loginData.username != _demoUsername ||
            loginData.password != _demoPassword) {
                throw Exception('Username atau password salah');
            }

        // Jika semua valid, return true
        return true;
    }
}