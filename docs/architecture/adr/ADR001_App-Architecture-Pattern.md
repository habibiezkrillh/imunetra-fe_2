# ADR 001: Pemilihan Arsitektur MVVM

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

Imunetra merupakan sistem digital berbasis mobile yang dirancang untuk mendeteksi kasus pneumonia pada anak-anak di wilayah terpencil. Sistem ini terdiri dari dua aplikasi yang saling terhubung:  
- Aplikasi **relawan**, yang digunakan untuk mencatat hasil pemeriksaan lapangan.  
- Aplikasi **tenaga kesehatan**, yang digunakan untuk menganalisis data dan menentukan tindak lanjut medis.

Karena aplikasi ini menangani data medis sensitif, membutuhkan sinkronisasi antara pengguna di lokasi tanpa akses internet dan pusat layanan kesehatan, serta menampilkan informasi secara dinamis, maka diperlukan pendekatan arsitektur yang mampu menjaga keterpisahan logika bisnis, antarmuka pengguna, dan alur data.  

## Decision

Tim memutuskan untuk menggunakan pendekatan **Model-View-ViewModel (MVVM)** untuk membangun kedua aplikasi Imunetra. Arsitektur ini dipilih karena cocok untuk aplikasi yang perlu menangani banyak perubahan data dan interaksi dua arah antara pengguna dan server.

Dalam arsitektur MVVM:
- **Model** bertanggung jawab mengelola sumber data (API, database lokal, atau cache) dan tidak bergantung pada tampilan.
- **ViewModel** mengatur logika aplikasi dan bertugas menyediakan data yang sudah diproses ke View, serta menampung input pengguna untuk diteruskan ke Model.
- **View** hanya berfokus pada menampilkan data dan merespons event atau perubahan state dari ViewModel.

## Consequences

### Keuntungan

- **Responsif terhadap data real-time**: Cocok untuk menampilkan data anak-anak yang diperiksa, termasuk status dugaan pneumonia secara langsung.
- **Lebih terstruktur**: Memudahkan pengembangan fitur secara modular, terutama ketika dua tim berbeda menangani aplikasi relawan dan aplikasi tenaga kesehatan.
- **Pengujian menjadi lebih mudah**: Karena logika aplikasi berada di ViewModel, dapat diuji tanpa melibatkan antarmuka pengguna atau server backend secara langsung.

### Potensi Risiko

- **Kebutuhan pembiasaan bagi tim baru**: Arsitektur ini mungkin tidak langsung familiar bagi developer yang terbiasa mencampur UI dan logika dalam satu file.
- **Perlu perencanaan sejak awal**: Perlu definisi yang jelas dalam pemisahan tanggung jawab antar lapisan sejak fase awal proyek.

### Mitigasi

- Menyediakan dokumentasi teknis internal mengenai pola MVVM dan praktik terbaiknya dalam Flutter.
- Menyusun struktur proyek secara konsisten sejak awal (misalnya: folder `models`, `view_models`, dan `views`).
- Melakukan pair programming dan review kode agar semua anggota tim bisa beradaptasi.

## Alternatives Considered

- **MVP atau MVC**: Terlalu menekankan pada View dan sulit menjaga logika tetap terpisah, terutama dalam aplikasi mobile modern seperti Flutter.
- **Clean Architecture**: Memberikan pemisahan tanggung jawab yang sangat baik, namun terlalu kompleks untuk kebutuhan saat ini dan tidak diperlukan pada fase awal pengembangan Imunetra.
