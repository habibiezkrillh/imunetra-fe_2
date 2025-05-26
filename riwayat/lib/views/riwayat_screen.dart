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
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,
            centerTitle: true,
            title: const Text(
              "Riwayat Kegiatan",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: _CustomTabBar(),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: BlocBuilder<KegiatanBloc, KegiatanState>(
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
        ),
      ),
    );
  }
}

class _CustomTabBar extends StatelessWidget {
  const _CustomTabBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KegiatanBloc, KegiatanState>(
      builder: (context, state) {
        return TabBar(
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
          labelColor: const Color(0xFF3B6BFD),
          unselectedLabelColor: Colors.grey,
          indicatorColor: const Color(0xFF3B6BFD),
          indicatorWeight: 3,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            letterSpacing: 0.5,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 12,            
          ),
          tabs: const [
            Tab(child: Center(child: Text('SEDANG \nBERLANGSUNG'))),
            Tab(child: Center(child: Text('AKAN DATANG'))),
            Tab(child: Center(child: Text('SELESAI'))),
        ],
       );
      },
    );
  }
}
