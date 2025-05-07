# ADR 008: Strategi Offline Support & Caching

## Status
Accepted

## Date
07/05/2025

## Decider 
Aurelia Davine Putri Nata 

## Informed
Leonard Widjaja
Muhammad Habbibie Zikrillah  

## Context

Relawan pengguna aplikasi Imunetra akan beroperasi di wilayah terpencil dengan koneksi internet yang tidak stabil. Namun mereka tetap harus bisa mencatat data anak yang diperiksa dan melihat riwayat yang sudah diinput. Maka diperlukan strategi penyimpanan lokal yang andal serta sistem caching agar aplikasi tetap responsif dan fungsional dalam kondisi offline.

## Decision

Tim memutuskan untuk menggunakan pendekatan **Local-First dengan Layer Cache Manual**, yaitu:

- Menyimpan data penting (seperti input pemeriksaan anak, riwayat, daftar desa) ke penyimpanan lokal terlebih dahulu.
- Sinkronisasi ke backend Laravel dilakukan secara berkala atau saat koneksi tersedia.
- Menggunakan SQLite untuk penyimpanan lokal tergantung kompleksitas data.
- Konten statis (seperti edukasi) dapat menggunakan cache berbasis header HTTP jika dibutuhkan.

## Consequences

### Keuntungan

- **Mendukung penggunaan offline penuh**, meningkatkan keandalan aplikasi.
- **Responsif** karena data sudah tersedia lokal.
- **Fleksibel**: tiap jenis data bisa ditangani sesuai kebutuhan (form pemeriksaan vs. artikel edukasi).

### Potensi Risiko

- **Konflik data** bisa muncul jika data diubah di dua sisi sebelum sinkronisasi.
- **Kompleksitas implementasi** lebih tinggi karena perlu mekanisme queue, flag isSynced, dan retry.

### Mitigasi

- Menandai setiap data lokal dengan status `isSynced`.
- Mengatur sistem retry dan background sync saat aplikasi mendeteksi koneksi kembali tersedia.
- Menyediakan indikator status sinkronisasi di UI agar pengguna tahu apakah data mereka sudah terkirim.

## Alternatives Considered

- **HTTP Caching**: Tidak cukup kuat untuk kebutuhan offline form pemeriksaan.
- **Backend-as-a-Service (Firebase)**: Tidak relevan karena backend menggunakan Laravel.
- **Real-time only (tanpa cache)**: Risiko kehilangan data dan pengalaman buruk di daerah tanpa koneksi.
