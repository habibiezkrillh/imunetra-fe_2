# ADR 002: Pemilihan State Management dengan BLoC

## Status
Accepted

## Date
07/05/2025

## Decider 
Leonard Widjaja

## Informed
Aurelia Davine Putri Nata  
Muhammad Habbibie Zikrillah  

## Context

Imunetra merupakan aplikasi dua sisi yang menangani proses deteksi dini penyakit pneumonia di daerah terpencil. Data yang dikumpulkan oleh relawan akan dikirim ke aplikasi tenaga kesehatan untuk dilakukan penilaian dan tindak lanjut. Aplikasi ini perlu menangani banyak alur logika kompleks, seperti:

- Input data pemeriksaan dengan validasi dan penyimpanan lokal sementara.
- Sinkronisasi data asinkron dengan server Laravel.
- Pengelolaan tampilan berdasarkan status pemeriksaan atau hasil analisis medis.

Karena itu, dibutuhkan pendekatan state management yang:

- Mampu memisahkan logika bisnis dari tampilan.
- Terstruktur dan mudah ditelusuri.
- Memiliki dokumentasi dan ekosistem yang stabil.

## Decision

Tim memilih menggunakan **BLoC (Business Logic Component)** sebagai pendekatan state management utama pada aplikasi Imunetra.  

Pola BLoC memungkinkan developer mengelola state melalui aliran data (`Stream`) dan memisahkan interaksi pengguna (event) dari hasil akhir yang ditampilkan (state).  

Setiap fitur utama akan dipecah menjadi:  
- **Event**: peristiwa yang dipicu dari UI (misalnya, `SubmitPemeriksaanEvent`).  
- **Bloc**: logika bisnis yang menangani event dan menghasilkan state.  
- **State**: representasi kondisi tampilan setelah suatu event diproses.

## Consequences

### Keuntungan

- **Struktur kode yang jelas dan terpisah**: Cocok untuk menjaga konsistensi antar modul, terutama pada dua aplikasi terpisah (relawan dan nakes).
- **Dukungan dokumentasi dan tooling yang baik**: `flutter_bloc` memiliki integrasi kuat dengan Flutter, termasuk fitur `BlocProvider`, `BlocBuilder`, dan DevTools.
- **Memudahkan debugging dan tracking state flow**: Developer dapat mengikuti alur perubahan state dari satu titik ke titik lain secara transparan.

### Potensi Risiko

- **Boilerplate dan verbose**: Penulisan event dan state secara eksplisit dapat terasa repetitif dan panjang.
- **Kurva belajar untuk pemula**: Developer baru perlu waktu memahami pola sinkronisasi event-stream-state.

### Mitigasi

- Menetapkan konvensi penamaan dan struktur folder yang konsisten untuk setiap modul BLoC.
- Menyediakan template generator (misalnya melalui `mason` atau VS Code snippets) untuk mempercepat pembuatan event dan state.
- Mendorong dokumentasi internal dan code review untuk menjaga standar.

## Alternatives Considered

- **Provider**: Lebih sederhana, namun kurang cocok untuk skenario logika kompleks seperti sinkronisasi data medis dan validasi input bertingkat.
- **Riverpod**: Memiliki fleksibilitas tinggi, namun dokumentasinya belum sematang BLoC dan lebih cocok untuk tim yang sudah familiar.
- **GetX**: Mudah digunakan, namun kurang direkomendasikan untuk tim besar atau proyek dengan kebutuhan arsitektur bersih dan jangka panjang.
