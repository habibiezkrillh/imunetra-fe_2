import '../models/profile_model.dart';

class ProfileService {
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

  Future<bool> updateProfile(ProfileModel profile) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulasi API call

    // Simulasi update berhasil
    return true;
  }

  Future<bool> logout() async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulasi logout

    // Simulasi logout berhasil
    return true;
  }
}