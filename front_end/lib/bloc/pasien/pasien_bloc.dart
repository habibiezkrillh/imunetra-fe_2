import 'package:flutter_bloc/flutter_bloc.dart';
import 'pasien_event.dart';
import 'pasien_state.dart';
import '../../models/pasien/pasien_model.dart';

class PasienBloc extends Bloc<PasienEvent, PasienState> {
  PasienBloc() : super(PasienInitial()) {
    on<LoadPasienList>(_onLoadPasienList);
  }

  Future<void> _onLoadPasienList(
      LoadPasienList event, Emitter<PasienState> emit) async {
    try {
      emit(PasienLoading());

      // Simulasi delay dan dummy data
      await Future.delayed(Duration(seconds: 1));

      final pasienList = [
        PasienModel(
          id: '1',
          nama: 'Reza Rahardian',
          umur: 6,
          jenisKelamin: 'Perempuan',
          status: StatusKesehatan.butuhBantuan,
        ),
        PasienModel(
          id: '2',
          nama: 'Rayyan Alfarezi Pratama',
          umur: 8,
          jenisKelamin: 'Laki-laki',
          status: StatusKesehatan.sehat,
        ),
      ];

      emit(PasienLoaded(pasienList));
    } catch (e) {
      emit(PasienError('Gagal memuat data pasien'));
    }
  }
}
