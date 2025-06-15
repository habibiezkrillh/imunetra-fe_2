import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:front_end/models/auth/register_model.dart';

class AuthService {
  // Ganti dengan URL API yang sesuai
  final String _baseUrl = 'https://192.168.1.5:800/api'; // Contoh IP Lokal. sesuaikan nanti dengan IP Backend

  Future<Map<String, dynamic>> registerTenagaMedis(RegisterTenagaMedisData data) async {
    final url = Uri.parse('$_baseUrl/register/tenagamedis');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data.toJson()),
      );

      if (response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        // tangani error dari backend (misal: validasi gagal 422, dll..)
        final errorBody = jsonDecode(response.body);
        throw Exception(errorBody['message'] ?? 'Pendaftaran gagal');
      }
    } catch (e) {
      // tangani error jaringan atau lainnya
      throw Exception('Terjadi kesalahan: $e');
    }
  }
  
  // ToDo: API Login
}