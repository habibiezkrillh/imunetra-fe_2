import 'package:flutter/material.dart';
import '../../../utils/theme.dart';
import 'hasil_deteksi.dart'; // Import halaman hasil deteksi

class DetailPasienView extends StatefulWidget {
  const DetailPasienView({super.key});

  @override
  State<DetailPasienView> createState() => _DetailPasienViewState();
}

class _DetailPasienViewState extends State<DetailPasienView> {
  // Form controllers
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _suhuController = TextEditingController();
  final TextEditingController _napasController = TextEditingController();
  final TextEditingController _diagnosisController = TextEditingController();
  final TextEditingController _obatController = TextEditingController();
  
  // Form key untuk validasi
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  // State variables
  String _jenisKelamin = 'Laki-laki';
  bool _isLoading = false;

  @override
  void dispose() {
    // Dispose controllers untuk menghindari memory leak
    _alamatController.dispose();
    _suhuController.dispose();
    _napasController.dispose();
    _diagnosisController.dispose();
    _obatController.dispose();
    super.dispose();
  }

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
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.text),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Hasil Pemeriksaan',
          style: blackTextStyle.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Informasi Pasien',
                style: blackTextStyle.copyWith(
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
                  style: blackTextStyle,
                  decoration: InputDecoration(
                    hintText: 'Nama Pasien',
                    hintStyle: greyTextStyle,
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
                        style: blackTextStyle,
                        decoration: InputDecoration(
                          hintText: 'Usia',
                          hintStyle: greyTextStyle,
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
                        value: _jenisKelamin,
                        style: blackTextStyle,
                        decoration: InputDecoration(
                          hintText: 'Jenis Kelamin',
                          hintStyle: greyTextStyle,
                          border: border,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _jenisKelamin = value;
                            });
                          }
                        },
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
                  controller: _alamatController,
                  maxLines: 2,
                  style: blackTextStyle,
                  decoration: InputDecoration(
                    hintText: 'Alamat',
                    hintStyle: greyTextStyle,
                    border: border,
                    contentPadding: const EdgeInsets.all(16),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Alamat harus diisi';
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 24),
              Text(
                'Data Kesehatan Pasien',
                style: blackTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),

              // Suhu Tubuh
              Container(
                decoration: shadow,
                child: TextFormField(
                  controller: _suhuController,
                  keyboardType: TextInputType.number,
                  style: blackTextStyle,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Suhu',
                    hintStyle: greyTextStyle,
                    border: border,
                    prefixText: 'Suhu Tubuh (°C) ',
                    prefixStyle: blackTextStyle,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Suhu tubuh harus diisi';
                    }
                    final suhu = double.tryParse(value);
                    if (suhu == null) {
                      return 'Format suhu tidak valid';
                    }
                    if (suhu < 30 || suhu > 45) {
                      return 'Suhu tubuh tidak normal (30-45°C)';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 12),

              // Frekuensi Napas
              Container(
                decoration: shadow,
                child: TextFormField(
                  controller: _napasController,
                  keyboardType: TextInputType.number,
                  style: blackTextStyle,
                  decoration: InputDecoration(
                    hintText: 'Masukkan',
                    hintStyle: greyTextStyle,
                    prefixText: 'Frekuensi Napas (per menit) ',
                    prefixStyle: blackTextStyle,
                    border: border,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Frekuensi napas harus diisi';
                    }
                    final napas = int.tryParse(value);
                    if (napas == null) {
                      return 'Format frekuensi napas tidak valid';
                    }
                    if (napas < 10 || napas > 60) {
                      return 'Frekuensi napas tidak normal (10-60 per menit)';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 12),

              // Diagnosis
              Container(
                decoration: shadow,
                child: TextFormField(
                  controller: _diagnosisController,
                  maxLines: 2,
                  style: blackTextStyle,
                  decoration: InputDecoration(
                    hintText: 'Diagnosis',
                    hintStyle: greyTextStyle,
                    border: border,
                    contentPadding: const EdgeInsets.all(16),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Diagnosis harus diisi';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 12),

              // Rekomendasi Obat
              Container(
                decoration: shadow,
                child: TextFormField(
                  controller: _obatController,
                  maxLines: 2,
                  style: blackTextStyle,
                  decoration: InputDecoration(
                    hintText: 'Rekomendasi Obat',
                    hintStyle: greyTextStyle,
                    border: border,
                    contentPadding: const EdgeInsets.all(16),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Rekomendasi obat harus diisi';
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.background,
                        foregroundColor: AppColors.primary,
                        side: const BorderSide(color: AppColors.primary),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      onPressed: _isLoading ? null : () => _tidakTerdeteksi(),
                      child: Text(
                        'Tidak Terdeteksi',
                        style: primaryTextStyle.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      onPressed: _isLoading ? null : () => _terdeteksi(),
                      child: _isLoading 
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            'Terdeteksi',
                            style: whiteTextStyle.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  // Business Logic Implementation
  void _tidakTerdeteksi() {
    // Validasi form terlebih dahulu
    if (!_formKey.currentState!.validate()) {
      _showSnackBar('Mohon lengkapi semua data yang diperlukan', Colors.red);
      return;
    }

    // TODO: Implement logic untuk "Tidak Terdeteksi"
    // Bisa berupa:
    // - Simpan data dengan status "Normal"
    // - Navigasi ke halaman hasil normal
    // - Kirim notifikasi ke sistem
    
    _showSnackBar('Data berhasil disimpan - Status: Normal', Colors.green);
    
    // Kembali ke halaman sebelumnya atau beranda
    Navigator.pop(context);
  }

  void _terdeteksi() async {
    // Validasi form terlebih dahulu
    if (!_formKey.currentState!.validate()) {
      _showSnackBar('Mohon lengkapi semua data yang diperlukan', Colors.red);
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // TODO: Implement API call untuk menyimpan data
      // Simulasi API call
      await Future.delayed(const Duration(seconds: 2));
      
      // TODO: Implement logic untuk "Terdeteksi"
      // - Simpan data dengan status "Terdeteksi"
      // - Kirim notifikasi ke relawan/dokter
      // - Log aktivitas
      
      // Navigasi ke halaman hasil deteksi
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HasilDeteksiView(),
          ),
        );
      }
    } catch (e) {
      _showSnackBar('Terjadi kesalahan: ${e.toString()}', Colors.red);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showSnackBar(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: whiteTextStyle,
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}