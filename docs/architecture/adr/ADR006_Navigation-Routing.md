# ADR 006: Pemilihan Navigation & Routing Solution - go_router

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

Imunetra memiliki dua jenis pengguna utama: mitra relawan dan tenaga kesehatan. Masing-masing memiliki alur navigasi tersendiri, serta kebutuhan untuk mengakses fitur-fitur spesifik seperti formulir pendataan, histori kasus, dan hasil analisis. Aplikasi ini juga direncanakan untuk mendukung deep linking (misalnya dari notifikasi ke halaman detail anak).

Diperlukan solusi navigasi yang mendukung:

- Routing bersarang (nested).
- Pengelolaan rute berdasarkan peran pengguna.
- Kemudahan redirect dan middleware (misal untuk otentikasi).
- Dukungan jangka panjang dari komunitas Flutter.

## Decision

Tim memutuskan untuk menggunakan **go_router** sebagai solusi routing utama.

- go_router dibangun di atas Navigator 2.0, tetapi dengan API yang lebih sederhana.
- Mendukung fitur-fitur kompleks seperti route guards, named routes, dan URL parameters.
- Dokumentasi resmi tersedia dan terintegrasi baik dengan ekosistem Flutter.

## Consequences

### Keuntungan

- **Struktur rute yang rapi**: Navigasi terpisah berdasarkan role (relawan vs tenaga kesehatan).
- **Mudah digunakan dan dikembangkan**: Sangat cocok untuk aplikasi menengah hingga besar.
- **Mendukung web & deep link**: Siap untuk kemungkinan pengembangan versi web di masa depan.

### Potensi Risiko

- **Kurva belajar awal**: Bagi developer yang terbiasa dengan Navigator 1.0, perlu adaptasi awal.
- **Perubahan besar jika migrasi dari Navigator 1.0**: Bila sebelumnya sempat pakai push/pop konvensional.

### Mitigasi

- Menyusun rencana struktur rute sejak awal (misalnya: `/relawan/home`, `/tenaga-kesehatan/detail-anak/:id`).
- Menyediakan dokumentasi internal dan template file router.
- Implementasi bertahap, mulai dari fitur inti.

## Alternatives Considered

- **Navigator 1.0**: Terlalu terbatas untuk skenario navigasi yang kompleks dan multi-role.
- **auto_route**: Sangat powerful, namun terlalu berat untuk kebutuhan saat ini, dan tergantung pada build_runner.
- **Navigator 2.0 native**: Terlalu verbose dan sulit dipelihara jika digunakan tanpa wrapper.

