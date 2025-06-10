import 'package:flutter/material.dart';
import '../../../utils/theme.dart';

class DetailPasienView extends StatelessWidget {
  const DetailPasienView({super.key});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    );

    final shadow = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6,
          offset: Offset(2, 3),
        )
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Hasil Pemeriksaan',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Informasi Pasien',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),

            // Nama Pasien
            Container(
              decoration: shadow,
              child: TextFormField(
                readOnly: true,
                initialValue: 'Rayyan Alfarezi Pratama',
                decoration: InputDecoration(
                  hintText: 'Nama Pasien',
                  border: border,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Usia & Jenis Kelamin
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: shadow,
                    child: TextFormField(
                      readOnly: true,
                      initialValue: '6 Tahun',
                      decoration: InputDecoration(
                        hintText: 'Usia',
                        border: border,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    decoration: shadow,
                    child: DropdownButtonFormField<String>(
                      items: const [
                        DropdownMenuItem(value: 'Laki-laki', child: Text('Laki-laki')),
                        DropdownMenuItem(value: 'Perempuan', child: Text('Perempuan')),
                      ],
                      value: 'Laki-laki',
                      decoration: InputDecoration(
                        hintText: 'Jenis Kelamin',
                        border: border,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Alamat
            Container(
              decoration: shadow,
              child: TextFormField(
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: 'Alamat',
                  border: border,
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              'Data Kesehatan Pasien',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),

            // Suhu Tubuh
            Container(
              decoration: shadow,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Masukkan Suhu',
                  border: border,
                  prefixText: 'Suhu Tubuh (°C) ',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Frekuensi Napas
            Container(
              decoration: shadow,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Masukkan',
                  prefixText: 'Frekuensi Napas (per menit) ',
                  border: border,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Diagnosis
            Container(
              decoration: shadow,
              child: TextFormField(
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: 'Diagnosis',
                  border: border,
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Rekomendasi Obat
            Container(
              decoration: shadow,
              child: TextFormField(
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: 'Rekomendasi Obat',
                  border: border,
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
            ),

            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF3B6BFD),
                    side: const BorderSide(color: Color(0xFF3B6BFD)),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    // ToDo: Tidak Terdeteksi button action
                  },
                  child: const Text(
                    'Tidak Terdeteksi',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B6BFD),
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    // ToDo: Terdeteksi button action
                  },
                  child: const Text(
                    'Terdeteksi',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
