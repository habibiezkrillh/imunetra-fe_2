class KegiatanModel {
  final String title;
  final String tanggal;
  final String waktu;
  final String lokasi;
  final String imageUrl;
  final String kategori; // sedang, akan_datang, selesai

  KegiatanModel({
    required this.title,
    required this.tanggal,
    required this.waktu,
    required this.lokasi,
    required this.imageUrl,
    required this.kategori,
  });
}