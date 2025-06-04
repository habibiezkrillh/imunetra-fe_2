import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/riwayat/riwayat_bloc.dart';
import '../../utils/theme.dart';
import '../widget/kegiatan_card.dart';
import '../widget/kosong_message.dart';

// Import untuk BottomNavbar
import '../widget/bottom_nav.dart';
import '../chat/chat_page.dart';
import '../home/home_page.dart';
import '../profile/profile_page.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RiwayatCubit()..changeTab(TabKategori.sedang),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Riwayat Kegiatan'),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Column(
          children: [
            _TabBar(),
            Expanded(child: _KegiatanContent()),
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: 2, // Riwayat
          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            } else if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ChatPage()),
              );
            } else if (index == 2) {
              // Stay in Riwayat
            } else if (index == 3) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            }
          },
        ),
      ),
    );
  }
}

class _TabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RiwayatCubit, RiwayatState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: TabKategori.values.map((tab) {
            final selected = state.currentTab == tab;
            final label = switch (tab) {
              TabKategori.sedang => 'Sedang Berlangsung',
              TabKategori.akanDatang => 'Akan Datang',
              TabKategori.selesai => 'Selesai',
            };

            return GestureDetector(
              onTap: () {
                context.read<RiwayatCubit>().changeTab(tab);
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      label,
                      style: TextStyle(
                        color: selected ? AppColors.primary : Colors.black,
                        fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                  if (selected)
                    Container(
                      height: 2,
                      width: 80,
                      color: AppColors.primary,
                    )
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _KegiatanContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RiwayatCubit, RiwayatState>(
      builder: (context, state) {
        if (state.kegiatan.isEmpty) {
          return KosongMessage(tab: state.currentTab);
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: state.kegiatan.length,
          itemBuilder: (_, i) {
            return KegiatanCard(model: state.kegiatan[i]);
          },
        );
      },
    );
  }
}