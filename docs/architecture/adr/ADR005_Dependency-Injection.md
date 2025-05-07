# ADR 005: Pemilihan Dependency Injection Framework - GetIt + injectable

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

Aplikasi Imunetra akan terus dikembangkan dan melibatkan banyak komponen seperti service, repository, ViewModel, dan controller. Untuk memudahkan pengelolaan dependency serta meningkatkan keterujian dan modularitas, diperlukan sebuah mekanisme dependency injection yang scalable.

## Decision

Tim memilih menggunakan kombinasi **GetIt** dan **injectable** sebagai solusi dependency injection di aplikasi Imunetra.

- `GetIt`: Bertindak sebagai service locator untuk dependency utama.
- `injectable`: Membantu mendaftarkan dependency secara otomatis menggunakan anotasi dan code generation.

Dengan pendekatan ini, dependency antar class akan dikelola lebih bersih dan minim boilerplate.

## Consequences

### Keuntungan

- **Modular dan scalable**: Cocok untuk proyek jangka panjang.
- **Mudah diuji**: Dependency bisa diganti mock saat testing.
- **Automatisasi**: injectable mengurangi penulisan kode pendaftaran service secara manual.

### Potensi Risiko

- **Setup awal cukup teknis**: Perlu konfigurasi awal dan pemahaman tentang code generation.
- **Kebutuhan pemahaman GetIt dan anotasi**: Perlu pelatihan ringan untuk tim baru.

### Mitigasi

- Menyediakan dokumentasi internal dan contoh implementasi DI.
- Menyusun struktur file `injection.dart` yang konsisten di seluruh modul.
- Menjadwalkan onboarding singkat bagi anggota baru.

## Alternatives Considered

- **Provider**: Lebih sederhana namun kurang cocok untuk aplikasi skala besar yang membutuhkan pengelolaan service.
- **Riverpod**: Fungsionalitas lengkap, namun dokumentasi masih terbatas dan tim belum familiar.
- **GetIt (tanpa injectable)**: Lebih manual dan berpotensi menghasilkan kode pendaftaran yang repetitif.

