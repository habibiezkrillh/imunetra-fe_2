# ADR 004: Penyimpanan Data Lokal dengan SQLite

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

Relawan pengguna aplikasi Imunetra akan melakukan pendataan pemeriksaan anak di wilayah terpencil yang seringkali tidak memiliki jaringan internet. Maka, dibutuhkan penyimpanan data lokal yang dapat:

- Menyimpan hasil pemeriksaan secara offline.
- Menampilkan ulang data di aplikasi sebelum sinkronisasi ke server.
- Mendukung struktur data yang kompleks dan bervariasi.

## Decision

Tim memilih menggunakan **SQLite** sebagai mekanisme penyimpanan lokal melalui package `sqflite`.

SQLite adalah basis data relasional yang cocok untuk menyimpan entitas data dengan banyak atribut serta keterkaitan antar tabel. Struktur data akan dirancang untuk mendukung kebutuhan sinkronisasi ke server Laravel saat koneksi tersedia.

## Consequences

### Keuntungan

- **Kuat dan stabil**: SQLite telah digunakan secara luas di banyak aplikasi produksi.
- **Relational-friendly**: Cocok untuk mencatat data pemeriksaan yang mungkin berelasi (misal: data gejala, lokasi, relawan).
- **Kontrol penuh**: Pengembang dapat menulis query SQL sesuai kebutuhan.

### Potensi Risiko

- **Verbosity**: Setup tabel dan operasi CRUD bisa memakan waktu dan verbose.
- **Tidak reactive**: UI tidak langsung bereaksi saat data diubah tanpa integrasi tambahan.

### Mitigasi

- Menggunakan pattern repository dan helper untuk menyederhanakan operasi CRUD.
- Menulis skrip SQL awal dalam file terpisah agar mudah dikelola.
- Mempertimbangkan integrasi dengan `stream` atau provider untuk menambah reaktivitas jika diperlukan.

## Alternatives Considered

- **Hive**: Lebih cepat dan ringan, namun kurang ideal untuk data berelasi dan query kompleks.
- **ObjectBox**: Menarik dari sisi performa, namun lebih sulit dipelajari dan belum sepopuler SQLite di ekosistem Flutter.
- **SharedPreferences**: Hanya cocok untuk data primitif seperti token, bukan untuk penyimpanan data pemeriksaan.

