class RegisterTenagaMedisData {
  final String namaTenagaMedis;
  final String kotaDomisili;
  final String nomorTelepon;
  final String email;
  final String kataSandi;
  final DateTime tanggalLahir;
  final String alamatLengkap;
  final String puskesmasRumahSakit;

  RegisterTenagaMedisData({
    required this.namaTenagaMedis,
    required this.kotaDomisili,
    required this.nomorTelepon,
    required this.email,
    required this.kataSandi,
    required this.tanggalLahir,
    required this.alamatLengkap,
    required this.puskesmasRumahSakit,
  });

  Map<String, dynamic> toJson() {
    return {
      'namatenagamedis': namaTenagaMedis,
      'kotadomisili': kotaDomisili,
      'nomortelepon': nomorTelepon,
      'email': email,
      'katasandi': kataSandi,
      'tanggalLahir': tanggalLahir.toIso8601String(), // Sesuaikan format jika backend mengharapkan 'YYYY-MM-DD' saja
      'alamatlengkap': alamatLengkap,
      'Puskesmas/RumahSakit': puskesmasRumahSakit,
    };
  }
}