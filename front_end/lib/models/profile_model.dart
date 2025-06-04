import 'dart:io';

class ProfileModel {
  final String? name;
  final String? email;
  final String? city;
  final String? phoneNumber;
  final String? profileImageUrl;
  final File? profileImageFile; // Tambahan untuk file image

  ProfileModel({
    this.name,
    this.email,
    this.city,
    this.phoneNumber,
    this.profileImageUrl,
    this.profileImageFile,
  });

  ProfileModel copyWith({
    String? name,
    String? email,
    String? city,
    String? phoneNumber,
    String? profileImageUrl,
    File? profileImageFile,
  }) {
    return ProfileModel(
      name: name ?? this.name,
      email: email ?? this.email,
      city: city ?? this.city,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      profileImageFile: profileImageFile ?? this.profileImageFile,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'city': city,
      'phoneNumber': phoneNumber,
      'profileImageUrl': profileImageUrl,
      // Note: File tidak bisa di-serialize ke JSON secara langsung
      // Untuk upload, perlu convert ke base64 atau multipart form
    };
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      email: json['email'],
      city: json['city'],
      phoneNumber: json['phoneNumber'],
      profileImageUrl: json['profileImageUrl'],
      // profileImageFile tidak di-load dari JSON karena ini file lokal
    );
  }

  // Helper method untuk check apakah ada image
  bool get hasImage => profileImageFile != null || (profileImageUrl != null && profileImageUrl!.isNotEmpty);
  
  // Helper method untuk mendapatkan image path
  String? get imagePath => profileImageFile?.path ?? profileImageUrl;
}