import 'package:flutter/material.dart';
import '../../models/pasien_model.dart';
import '../../utils/theme.dart';

class PasienCard extends StatelessWidget {
  final PasienModel model;

  const PasienCard({super.key, required this.model});

  Color getStatusColor(StatusKesehatan status) {
    switch (status) {
      case StatusKesehatan.sehat:
        return Colors.green;
      case StatusKesehatan.butuhBantuan:
        return Colors.red;
    }
  }

  String getStatusLabel(StatusKesehatan status) {
    switch (status) {
      case StatusKesehatan.sehat:
        return 'Sehat';
      case StatusKesehatan.butuhBantuan:
        return 'Butuh Bantuan';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF3B6BFD), width: 1),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    model.nama,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: getStatusColor(model.status),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    getStatusLabel(model.status),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 4),
            Text(
              '${model.umur} tahun | ${model.jenisKelamin}',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B6BFD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                minimumSize: const Size.fromHeight(36),
              ),
              onPressed: () {},
              child: const Text(
                'Lihat Data Pasien',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
