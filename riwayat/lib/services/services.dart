import 'package:riwayat/models/kegiatan.dart';

class KegiatanService {
  Future<List<KegiatanModel>> fetchKegiatan() async {
    await Future.delayed(Duration(seconds: 1));
    return []; // Kosong untuk sekarang
  }
}
