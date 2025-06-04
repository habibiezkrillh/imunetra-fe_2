import 'package:flutter/material.dart';
import '../../../models/kegiatan_model.dart';
import '../../utils/theme.dart';

class KegiatanCard extends StatelessWidget {
  final KegiatanModel model;

  const KegiatanCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Image.asset(
            model.imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: whiteTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 14, color: Colors.white),
                    const SizedBox(width: 4),
                    Text(model.tanggal, style: whiteTextStyle.copyWith(fontSize: 12)),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 14, color: Colors.white),
                    const SizedBox(width: 4),
                    Text(model.waktu, style: whiteTextStyle.copyWith(fontSize: 12)),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.white),
                    const SizedBox(width: 4),
                    Text(model.lokasi, style: whiteTextStyle.copyWith(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
