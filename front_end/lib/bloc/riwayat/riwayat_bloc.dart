import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/models/kegiatan_model.dart';

enum TabKategori { sedang, akanDatang, selesai }

class RiwayatState {
    final TabKategori currentTab;
    final List<KegiatanModel> kegiatan;

    RiwayatState(this.currentTab, this.kegiatan);
}

class RiwayatCubit extends Cubit<RiwayatState> {
    RiwayatCubit() : super(RiwayatState(TabKategori.sedang, []));

    void changeTab(TabKategori tab) {
        // Dummy data sementara
        List<KegiatanModel> semua = [
            KegiatanModel(
                title: 'Desa Sehat Ta',
                tanggal: '20 - 22 Juni 2025',
                waktu: '10.00 - 16.00',
                lokasi: 'Desa Kanjilo',
                imageUrl: 'assets/images/event_card1.jpg',
                kategori: 'sedang',
            )
        ];

        emit(RiwayatState(
            tab,
            semua.where((e) => e.kategori == tab.name).toList()
        ));
    }
}