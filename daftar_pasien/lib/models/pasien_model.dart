class PasienModel {
  final String id;
  final String nama;
  final int umur;
  final String jenisKelamin;
  final StatusKesehatan status;

  PasienModel({
    required this.id,
    required this.nama,
    required this.umur,
    required this.jenisKelamin,
    required this.status,
  });
}

enum StatusKesehatan {
  sehat,
  butuhBantuan,
}

