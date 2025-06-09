import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/profile_model.dart';

class ProfileService {
  // Base URL API Anda
  final String baseUrl = 'https://your-api-url.com/api';

  // Simulasi data profile untuk demo
  Future<ProfileModel> getProfile() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulasi loading
    
    return ProfileModel(
      name: '',
      email: '',
      city: 'Kota Domisili',
      phoneNumber: '',
      profileImageUrl: null,
    );
  }

  // Update profile dengan support untuk image upload
  Future<bool> updateProfile(ProfileModel profile) async {
    try {
      // Jika ada image file, upload terlebih dahulu
      String? imageUrl;
      if (profile.profileImageFile != null) {
        imageUrl = await _uploadImage(profile.profileImageFile!);
      } else {
        imageUrl = profile.profileImageUrl;
      }

      // Simulasi API call untuk update profile
      await Future.delayed(const Duration(seconds: 1));
      
      // Di sini Anda bisa implement actual API call
      /*
      final response = await http.put(
        Uri.parse('$baseUrl/profile'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer YOUR_TOKEN',
        },
        body: jsonEncode({
          'name': profile.name,
          'email': profile.email,
          'city': profile.city,
          'phoneNumber': profile.phoneNumber,
          'profileImageUrl': imageUrl,
        }),
      );
      
      return response.statusCode == 200;
      */
      
      // Simulasi update berhasil
      return true;
    } catch (e) {
      print('Error updating profile: $e');
      return false;
    }
  }

  // Function untuk upload image ke server
  Future<String?> _uploadImage(File imageFile) async {
    try {
      // Simulasi upload delay
      await Future.delayed(const Duration(seconds: 2));
      
      // Di sini implement actual image upload
      /*
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/upload/profile-image'),
      );
      
      request.headers.addAll({
        'Authorization': 'Bearer YOUR_TOKEN',
      });
      
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          imageFile.path,
        ),
      );
      
      var response = await request.send();
      
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var jsonData = jsonDecode(responseData);
        return jsonData['imageUrl']; // Return URL dari server
      }
      */
      
      // Simulasi return URL
      return 'https://example.com/uploaded-image-${DateTime.now().millisecondsSinceEpoch}.jpg';
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  // Function untuk compress image sebelum upload (opsional)
  Future<File?> compressImage(File imageFile) async {
    try {
      // Di sini bisa implement image compression
      // Menggunakan package seperti flutter_image_compress
      
      return imageFile; // Return original untuk sekarang
    } catch (e) {
      print('Error compressing image: $e');
      return null;
    }
  }

  Future<bool> logout() async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulasi logout
    
    // Simulasi logout berhasil
    return true;
  }
}