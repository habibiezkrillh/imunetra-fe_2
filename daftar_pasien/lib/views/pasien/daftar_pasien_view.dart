import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/pasien/pasien_bloc.dart';
import '../../bloc/pasien/pasien_event.dart';
import '../../bloc/pasien/pasien_state.dart';
import 'pasien_card.dart';
import '../../utils/theme.dart';

class DaftarPasienView extends StatelessWidget {
  const DaftarPasienView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Daftar Pasien',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications, color: Color(0xFF3B6BFD)),
          ),
        ],
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => PasienBloc()..add(LoadPasienList()),
        child: BlocBuilder<PasienBloc, PasienState>(
          builder: (context, state) {
            if (state is PasienLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PasienLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.pasienList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: PasienCard(model: state.pasienList[index]),
                  );
                },
              );
            } else if (state is PasienError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
