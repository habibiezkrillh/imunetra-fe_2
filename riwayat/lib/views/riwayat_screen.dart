import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riwayat/bloc/riwayat_bloc.dart';
import 'package:riwayat/widgets/riwayat_widget.dart';


class RiwayatKegiatanPage extends StatelessWidget {
  const RiwayatKegiatanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => KegiatanBloc(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Riwayat Kegiatan",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
            
            centerTitle: true, 

            bottom: TabBar(
              onTap: (index) {
                final bloc = context.read<KegiatanBloc>();
                switch (index) {
                  case 0:
                    bloc.add(TabChanged(TabStatus.sedang));
                    break;
                  case 1:
                    bloc.add(TabChanged(TabStatus.akan));
                    break;
                  case 2:
                    bloc.add(TabChanged(TabStatus.selesai));
                    break;
                }
              },
              tabs: const [
                Tab(text: 'Sedang Berlangsung'),
                Tab(text: 'Akan Datang'),
                Tab(text: 'Selesai'),
              ],
            ),
          ),
          body: BlocBuilder<KegiatanBloc, KegiatanState>(
            builder: (context, state) {
              if (state.kegiatan.isEmpty) {
                String message = '';
                switch (state.selectedTab) {
                  case TabStatus.sedang:
                    message = 'Belum ada kegiatan yang sedang berlangsung';
                    break;
                  case TabStatus.akan:
                    message = 'Belum ada kegiatan yang akan datang';
                    break;
                  case TabStatus.selesai:
                    message = 'Belum ada kegiatan yang sudah selesai';
                    break;
                }
                return KegiatanEmptyWidget(message: message);
              }
              return ListView.builder(
                itemCount: state.kegiatan.length,
                itemBuilder: (context, index) {
                  final kegiatan = state.kegiatan[index];
                  return ListTile(
                    title: Text(kegiatan.nama),
                    subtitle: Text(kegiatan.tanggal.toString()),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
