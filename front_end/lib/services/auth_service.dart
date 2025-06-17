import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:front_end/models/auth/register_model.dart';

class AuthService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';
  
  // Header default untuk semua request
  Map<String, String> get _headers => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  /// Register Tenaga Medis
  Future<Map<String, dynamic>> registerTenagaMedis(RegisterTenagaMedisData data) async {
    try {
      final url = Uri.parse('$baseUrl/register/tenaga-medis');
      
      // Konversi data ke JSON sesuai dengan backend
      final requestBody = {
        'namatenagamedis': data.namaTenagaMedis,
        'kotadomisili': data.kotaDomisili,
        'nomortelepon': data.nomorTelepon,
        'email': data.email,
        'katasandi': data.kataSandi,
        'tanggallahir': _formatDateForBackend(data.tanggalLahir), // Format: YYYY-MM-DD
        'alamatlengkap': data.alamatLengkap,
        'puskesmas_rumahsakit': data.puskesmasRumahSakit, // Sesuai dengan backend
      };

      print('Request URL: $url');
      print('Request Body: ${jsonEncode(requestBody)}');

      final response = await http.post(
        url,
        headers: _headers,
        body: jsonEncode(requestBody),
      );

      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 201) {
        // Registrasi berhasil
        final responseData = jsonDecode(response.body);
        return responseData;
      } else if (response.statusCode == 422) {
        // Validation error
        final errorData = jsonDecode(response.body);
        final errors = errorData['errors'] as Map<String, dynamic>;
        
        // Ambil error pertama untuk ditampilkan
        String errorMessage = '';
        errors.forEach((key, value) {
          if (value is List && value.isNotEmpty) {
            errorMessage += '${value.first}\n';
          }
        });
        
        throw Exception(errorMessage.trim());
      } else {
        // Error lainnya
        final errorData = jsonDecode(response.body);
        throw Exception(errorData['message'] ?? 'Terjadi kesalahan pada server');
      }
    } catch (e) {
      if (e.runtimeType.toString().contains('SocketException')) {
        throw Exception('Tidak dapat terhubung ke server. Pastikan server berjalan dan koneksi internet stabil.');
      }
      
      if (e.runtimeType.toString().contains('FormatException')) {
        throw Exception('Response dari server tidak valid');
      }
      
      // Re-throw exception yang sudah dihandle
      rethrow;
    }
  }

  // ToDo: Implementasi Login Tenaga Medis
  // Future<Map<String, dynamic>> loginTenagaMedis({
  //   required String email,
  //   required String password,
  // }) async {
  //   // Akan diimplementasi nanti
  // }

  /// Format tanggal untuk backend (YYYY-MM-DD)
  String _formatDateForBackend(DateTime date) {
    return '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  /// Test koneksi ke server
  Future<bool> testConnection() async {
    try {
      final url = Uri.parse('$baseUrl/test'); // Endpoint test jika ada
      final response = await http.get(url).timeout(
        const Duration(seconds: 5),
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Connection test failed: $e');
      return false;
    }
  }
}