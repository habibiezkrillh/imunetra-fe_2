import 'package:front_end/models/register_model.dart';

class RegisterService {
  // Simulated delay for API call (belum di fetching wak)
  final Duration simulatedDelay;

  RegisterService({this.simulatedDelay = const Duration(seconds: 2)});

  Future<void> register(RegisterData data) async {
    // Simulate network delay
    await Future.delayed(simulatedDelay);

    // Simulate validation errors
    if (data.email.contains('test')) {
      throw Exception('Email dengan kata "test" tidak diperbolehkan');
    }

    if (data.password.length < 6) {
      throw Exception('Password harus minimal 6 karakter');
    }

    if (data.ktpFile == null) {
      throw Exception('Harap upload file KTP');
    }

    // Simulate successful registration
    return;
  }

  // Simulated function to upload file
  Future<String> uploadFile(String filePath) async {
    await Future.delayed(const Duration(seconds: 1));

    if (filePath.isEmpty) {
      throw Exception('File tidak valid');
    }

    // Return simulated file URL
    return 'https://example.com/uploads/${filePath.split('/').last}';
  }
}