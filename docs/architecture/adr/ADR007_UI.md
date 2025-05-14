# ADR 007: Pemilihan Theming & UI Styling

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

Aplikasi Imunetra memiliki dua jenis pengguna utama: **relawan lapangan** dan **tenaga kesehatan**. Meskipun mereka mengakses fitur yang berbeda, keseluruhan aplikasi harus tetap konsisten secara visual dan efisien dalam proses pengembangannya.

Demi menjaga keseragaman desain serta menyederhanakan pengembangan antarmuka pengguna, diperlukan pendekatan styling yang:
- Terintegrasi langsung dengan framework Flutter.
- Mudah digunakan dan dikustomisasi secara global.
- Tidak membutuhkan konfigurasi tambahan atau sistem design terpisah.

## Decision  

Tim memutuskan untuk menggunakan **Material Design bawaan Flutter** sebagai sistem theming dan styling utama aplikasi Imunetra.

- `ThemeData`, `ColorScheme`, dan `TextTheme` akan dimanfaatkan secara langsung sesuai standar Flutter.
- Elemen-elemen seperti warna utama, sekunder, serta tipografi dasar akan didefinisikan dalam satu file pusat (`theme.dart`).

## Consequences  

### Keuntungan

- **Praktis dan efisien**: Menggunakan apa yang sudah disediakan oleh Flutter tanpa perlu library tambahan.
- **Mudah dipelajari dan digunakan**: Developer cukup mengikuti standar bawaan Material.
- **Konsistensi otomatis**: UI di seluruh aplikasi memiliki tampilan yang seragam.

### Potensi Risiko

- **Kurangnya fleksibilitas visual** jika di masa depan dibutuhkan perbedaan tampilan antar peran atau tema.
- **Keterbatasan kustomisasi mendalam** jika dibandingkan dengan sistem design custom atau framework UI eksternal.

### Mitigasi

- Seluruh styling dasar seperti warna dan font akan dikonsolidasikan di `theme.dart` agar memudahkan perubahan jika dibutuhkan nanti.
- Bila diperlukan di masa mendatang, pendekatan ini tetap bisa dikembangkan lebih lanjut tanpa mengganti seluruh struktur styling.

## Alternatives Considered

- **Cupertino Theming**: Tidak digunakan karena aplikasi ini bersifat lintas platform dan tidak eksklusif untuk iOS.
- **Custom Design System dari Nol**: Dianggap terlalu kompleks dan tidak efisien untuk kebutuhan Imunetra saat ini, terutama pada fase awal pengembangan.
