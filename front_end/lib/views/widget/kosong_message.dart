import 'package:flutter/material.dart';
import '../../utils/theme.dart';
import '../../bloc/riwayat/riwayat_bloc.dart';

class KosongMessage extends StatelessWidget {
  final TabKategori tab;

  const KosongMessage({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    final text = switch (tab) {
      TabKategori.akanDatang => 'Belum ada kegiatan yang akan datang',
      TabKategori.selesai => 'Belum ada kegiatan yang telah selesai',
      _ => '',
    };

    return Center(
      child: Text(
        text,
        style: greyTextStyle.copyWith(fontSize: 14),
      ),
    );
  }
}
