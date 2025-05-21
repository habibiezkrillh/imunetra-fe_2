# ADR 009: Strategi Error Handling & Monitoring

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

Aplikasi Imunetra akan digunakan di daerah terpencil, di mana bug atau crash yang terjadi harus bisa dideteksi dan ditangani secepat mungkin agar tidak mengganggu proses pemeriksaan anak-anak oleh relawan dan validasi oleh tenaga kesehatan. Karena sistem ini memiliki dua sisi (Flutter frontend dan Laravel backend), dibutuhkan solusi monitoring yang lintas platform, fleksibel, dan mendukung integrasi mendalam.

## Decision

Tim memutuskan menggunakan **custom error handling** sebagai strategi penanganan dan pemantauan error dalam proyek iMunetra. Strategi ini dipilih karena:
- Dapat disesuaikan dengan kebutuhan proyek tanpa bergantung pada layanan pihak ketiga.
- Memungkinkan pengelolaan error secara spesifik berdasarkan jenis error dan platform.
- Mempermudah debugging awal dan pelaporan error yang dikendalikan sendiri.
- Dapat diintegrasikan dengan sistem notifikasi internal seperti email atau Telegram.
- Mendukung logging ke file atau database untuk keperluan audit dan pelacakan.

## Consequences

### Keuntungan
- Kontrol penuh terhadap proses logging dan penanganan error.
- Tidak tergantung layanan eksternal, sehingga lebih ringan dan fleksibel.
- Dapat disesuaikan dengan kebutuhan monitoring proyek iMunetra.
- Privasi lebih terjaga, karena data tidak dikirim ke layanan pihak ketiga.

### Potensi Risiko
- Kurang observabilitas real-time, terutama jika tidak ada sistem notifikasi aktif.
- Perlu lebih banyak waktu pengembangan untuk membangun sistem logging dan pelaporan.
- Tidak ada dasbor bawaan seperti di layanan monitoring profesional.

### Mitigasi
- Mengembangkan sistem logging sederhana untuk menyimpan error lokal dan backend.
- Menambahkan middleware untuk mencatat error di backend Laravel dan mengirim laporan ke admin.
- Di sisi Flutter, membuat handler global untuk mencatat error dan mengirim data error via API.
- Menyediakan panduan debugging bagi relawan dan admin.


## Alternatives Considered

- **Sentry**: Lengkap dan otomatis, tetapi memerlukan integrasi tambahan dan ketergantungan pihak ketiga.
- **Firebase Crashlytics**: Mudah diintegrasikan ke Flutter, tapi tidak mendukung Laravel backend.
- **Tanpa Monitoring**: Tidak disarankan karena menyulitkan penanganan error di lapangan.
