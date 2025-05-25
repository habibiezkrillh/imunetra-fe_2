import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riwayat/models/kegiatan.dart';

enum TabStatus { sedang, akan, selesai }

class KegiatanState {
  final List<KegiatanModel> kegiatan;
  final TabStatus selectedTab;

  KegiatanState({required this.kegiatan, required this.selectedTab});
}

abstract class KegiatanEvent {}

class TabChanged extends KegiatanEvent {
  final TabStatus tab;

  TabChanged(this.tab);
}

class KegiatanBloc extends Bloc<KegiatanEvent, KegiatanState> {
  KegiatanBloc()
      : super(KegiatanState(kegiatan: [], selectedTab: TabStatus.akan)) {
    on<TabChanged>((event, emit) {
      // dummy data logic
      List<KegiatanModel> kegiatan = [];
      emit(KegiatanState(kegiatan: kegiatan, selectedTab: event.tab));
    });
  }
}
