import 'package:flutter/material.dart';
import '../../../utils/theme.dart';

import '../home_page.dart';

class HasilDeteksiView extends StatelessWidget {
  const HasilDeteksiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.text),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              
              // Content area bisa ditambahkan di sini
              // Misalnya logo, ilustrasi, atau informasi lainnya
              
              const Spacer(),
              
              // Button "Hubungi Relawan"
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    // TODO: Implement hubungi relawan logic
                    _hubungiRelawan(context);
                  },
                  child: Text(
                    'Hubungi Relawan',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Button "Kembali ke Beranda"
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.text,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    );
                    _kembaliKeBeranda(context);
                  },
                  child: Text(
                    'Kembali ke Beranda',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  void _hubungiRelawan(BuildContext context) {
    // TODO: Implement logic untuk menghubungi relawan
    // Bisa berupa:
    // - Buka aplikasi telepon dengan nomor relawan
    // - Navigasi ke halaman chat dengan relawan
    // - Buka WhatsApp dengan nomor relawan
    // - dll
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Hubungi Relawan',
          style: blackTextStyle.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          'Fitur menghubungi relawan akan segera tersedia.',
          style: greyTextStyle,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'OK',
              style: primaryTextStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _kembaliKeBeranda(BuildContext context) {
    // Navigasi kembali ke halaman beranda
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  } 
}