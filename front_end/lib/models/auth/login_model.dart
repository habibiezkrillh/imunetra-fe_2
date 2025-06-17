class LoginTenagaMedisData {
  final String email;
  final String kataSandi;

  LoginTenagaMedisData({
    required this.email,
    required this.kataSandi,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'katasandi': kataSandi,
    };
  }
}