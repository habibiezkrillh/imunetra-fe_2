class ProfileService {
  // In a real app, this would make API calls
  Future<Map<String, dynamic>> fetchProfile() async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      'email': 'user@example.com',
    };
  }

  Future<void> updateProfile(Map<String, dynamic> data) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}