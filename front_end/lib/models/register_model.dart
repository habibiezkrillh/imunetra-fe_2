class RegisterData {
  final String fullName;
  final String email;
  final String city;
  final String phoneNumber;
  final String password;
  final DateTime birthDate;
  final String address;
  final String? ktpFile;

  RegisterData({
    required this.fullName,
    required this.email,
    required this.city,
    required this.phoneNumber,
    required this.password,
    required this.birthDate,
    required this.address,
    this.ktpFile,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'city': city,
      'phoneNumber': phoneNumber,
      'password': password,
      'birthDate': birthDate.toIso8601String(),
      'address': address,
      'ktpFile': ktpFile,
    };
  }
}