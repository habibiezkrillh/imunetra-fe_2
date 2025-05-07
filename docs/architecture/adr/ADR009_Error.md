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

Tim memutuskan menggunakan **Sentry** sebagai solusi error handling dan monitoring untuk proyek Imunetra. Sentry dipilih karena:

- Mendukung **Flutter** dan **Laravel** secara native.
- Memungkinkan tracking **crash, error non-fatal**, dan **performance monitoring**.
- Memberikan fitur **breadcrumbs**, yang menunjukkan kronologi event sebelum error.
- Mampu menghubungkan frontend dan backend dalam satu proyek monitoring.

## Consequences

### Keuntungan

- **Observabilitas menyeluruh** dari frontend dan backend.
- **Dashboard interaktif** yang memudahkan debugging dan kolaborasi antar tim.
- **Tracking granular**, seperti tag lokasi, device, user, dan event.
- Mendukung **alert otomatis**, integrasi ke Slack/email.

### Potensi Risiko

- Beberapa fitur lanjutan terbatas di versi gratis (misalnya history lebih dari 30 hari).
- Setup awal lebih kompleks daripada solusi seperti Crashlytics.

### Mitigasi

- Fokus pada setup inti terlebih dahulu (capture exception dan breadcrumbs).
- Gunakan versi komunitas/gratis untuk awal pengembangan dan evaluasi kebutuhan upgrade saat scaling.
- Dokumentasikan standar implementasi logging dan penanganan error sejak awal.

## Alternatives Considered

- **Firebase Crashlytics**: Integrasi cepat dengan Flutter, tetapi tidak mendukung Laravel secara langsung. Tidak ideal untuk kebutuhan observabilitas lintas platform.
- **Custom Logging**: Lebih fleksibel tapi membutuhkan banyak waktu pengembangan dan tidak memiliki fitur realtime.
- **Tanpa Monitoring**: Tidak dipertimbangkan karena terlalu berisiko untuk aplikasi lapangan seperti Imunetra.
