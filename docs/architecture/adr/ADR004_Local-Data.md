# ADR 004: Penyimpanan Data Lokal dengan ObjectBox

## Status
Accepted

## Date
07/05/2025

## Decider 
Muhammad Habbibie Zikrillah  

## Informed
Aurelia Davine Putri Nata  
Leonard Widjaja

## Context

Relawan pengguna aplikasi iMunetra akan melakukan pendataan pemeriksaan anak di wilayah terpencil yang seringkali tidak memiliki jaringan internet. Maka, dibutuhkan penyimpanan data lokal yang dapat:
- Menyimpan hasil pemeriksaan secara offline.
- Menampilkan ulang data di aplikasi sebelum sinkronisasi ke server.
- Mendukung struktur data yang kompleks dan bervariasi.

## Decision

Tim memutuskan untuk menggunakan **ObjectBox** sebagai tempat penyimpanan data lokal di aplikasi.
ObjectBox adalah database NoSQL yang menyimpan data dalam bentuk objek dan bekerja sangat cepat.

Kami memilih ObjectBox karena mudah digunakan, cepat saat menyimpan dan mengambil data, serta cocok untuk menyimpan data yang bentuknya kompleks tanpa perlu membuat relasi tabel seperti di database biasa.

## Consequences

### Keuntungan
- Performa tinggi: ObjectBox sangat cepat dalam operasi baca/tulis data.
- Mudah digunakan: Tidak memerlukan banyak konfigurasi dan mendukung pendekatan berbasis objek.
- Skalabilitas: Dapat menangani data dalam jumlah besar secara efisien.
- Integrasi Flutter yang kuat: Dukungan resmi dan dokumentasi yang baik untuk Flutter.

### Potensi Risiko
- Kompatibilitas: Tidak menggunakan model relasional; perlu penyesuaian jika di masa depan butuh interoperabilitas dengan sistem relasional seperti Laravel.
- Ukuran Package: Ukuran package bisa sedikit lebih besar dibandingkan SQLite.

### Mitigasi
- Menyusun struktur data model yang konsisten agar mudah untuk disinkronisasikan ke server Laravel.
- Menyediakan adapter atau konversi data untuk integrasi dengan backend relasional.
- Menyusun dokumentasi penggunaan dan struktur data untuk memudahkan pengembangan lebih lanjut.

## Alternatives Considered

- Hive: Lebih cepat dan ringan, namun kurang ideal untuk data yang kompleks.
- SQLite: Stabil dan banyak digunakan, tetapi setup dan integrasi relasional bisa lebih kompleks.
- SharedPreferences: Hanya cocok untuk data primitif seperti token, tidak untuk penyimpanan data pemeriksaan.
