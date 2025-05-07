# ADR 007: Pemilihan Theming & UI Styling

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

Aplikasi Imunetra melayani dua peran pengguna utama: relawan lapangan dan tenaga kesehatan. Setiap peran mengakses fitur berbeda, namun tetap berada dalam satu ekosistem aplikasi yang harus terlihat dan terasa konsisten. Aplikasi juga akan digunakan dalam berbagai kondisi pencahayaan, sehingga perlu mendukung tema terang dan gelap.

Kami membutuhkan sistem theming yang:

- Mendukung konsistensi visual antar halaman dan komponen.
- Mudah dikustomisasi secara global.
- Memungkinkan branding ulang jika dibutuhkan oleh institusi.

## Decision

Tim memutuskan untuk menggunakan **Material Theming Flutter** yang dikustomisasi sesuai identitas visual Imunetra.

- Akan digunakan `ThemeData`, `ColorScheme`, `TextTheme`, dan komponen-komponen Material 3.
- Warna utama, sekunder, dan tipografi akan didefinisikan dalam satu sumber pusat (`theme.dart`).
- Mendukung Light Theme dan Dark Theme, dengan toggle adaptif bila diperlukan.

## Consequences

### Keuntungan

- **Cepat dan praktis**: Terintegrasi langsung dalam framework Flutter.
- **Konsistensi otomatis**: Semua komponen UI mengikuti tema global.
- **Siap Material 3**: Dukungan desain modern dan fleksibel.

### Potensi Risiko

- **Tampilan generik jika tidak dikustomisasi**.
- **Butuh pendekatan ekstra untuk styling granular per peran** jika ingin tampilan yang benar-benar berbeda antar role.

### Mitigasi

- Mengatur token warna, padding, dan font sejak awal dalam file `theme.dart`.
- Menyusun guideline visual internal (spacing, corner radius, dsb).
- Jika dibutuhkan, menambahkan `AppTheme` class yang menyesuaikan tampilan berdasarkan role pengguna.

## Alternatives Considered

- **Cupertino Theming**: Tidak relevan karena fokus hanya pada platform iOS.
- **Custom Design System Full**: Terlalu berat untuk versi awal dan memerlukan effort besar dalam dokumentasi dan pengujian konsistensi.
