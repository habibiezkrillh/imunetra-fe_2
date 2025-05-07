# ADR 010: Strategi Pengujian & CI/CD Pipeline

## Status
Proposed

## Date
07/05/2025

## Decider 
Muhammad Habbibie Zikrillah  

## Informed
Leonard Widjaja
Aurelia Davine Putri Nata  

## Context

Aplikasi Imunetra akan digunakan oleh tenaga kesehatan dan relawan di lapangan, sehingga stabilitas dan reliabilitas aplikasi sangat penting. Untuk memastikan aplikasi tetap berkualitas tinggi, dibutuhkan strategi pengujian yang menyeluruh dan pipeline CI/CD untuk otomatisasi build dan deployment.

Namun, karena tim masih dalam tahap pengembangan awal dan untuk menjaga kelancaran progres, **CI/CD dan pengujian otomatis** (unit, widget, dan integration testing) akan **ditunda sementara**. Selama fase ini, tim akan lebih fokus pada pengembangan dan testing manual untuk memastikan aplikasi sudah stabil.

## Decision

Tim memutuskan untuk menunda implementasi **CI/CD dan pengujian otomatis** dan berfokus pada **manual testing** pada perangkat Android untuk saat ini. Keputusan ini diambil dengan pertimbangan:

1. **Manual Testing**:
   - Pengujian dilakukan langsung pada perangkat Android untuk memastikan fungsi aplikasi berjalan dengan baik dan dapat menangani kasus-kasus yang mungkin tidak terdeteksi pada tahap pengujian otomatis.
   - Manual testing dilakukan untuk mengidentifikasi isu kritikal dan meningkatkan pengalaman pengguna, sambil meningkatkan stabilitas kode.

2. **CI/CD dan Testing Otomatis**:
   - **CI/CD pipeline** (GitHub Actions) dan **pengujian otomatis** (unit, widget, integration tests) akan diimplementasikan setelah aplikasi menunjukkan stabilitas yang lebih baik dan proses pengembangan mencapai tahap yang lebih matang.

## Consequences

### Keuntungan

- **Fokus pada kestabilan kode**: Pengujian manual memungkinkan tim untuk memprioritaskan stabilitas kode di lapangan.
- **Fleksibilitas** dalam menanggapi perubahan cepat di tahap pengembangan awal.
- **Pengujian yang realistis** melalui testing manual di perangkat Android.

### Potensi Risiko

- **Kurangnya otomatisasi**: Tanpa CI/CD dan testing otomatis, risiko bug atau regresi yang tidak terdeteksi meningkat seiring dengan perubahan kode.
- **Proses pengujian lebih lambat** karena keterbatasan pengujian manual dibandingkan otomatis.

### Mitigasi

- Fokus pada stabilitas dan penyelesaian bug kritikal dengan pengujian manual.
- Rencanakan implementasi CI/CD dan pengujian otomatis dalam fase berikutnya setelah kode lebih stabil dan siap untuk otomatisasi.

## Alternatives Considered

- **CI/CD dan Testing Otomatis segera**: Ditunda untuk menghindari kerumitan setup awal yang mungkin mengganggu progres pengembangan saat ini.
- **Tanpa Testing sama sekali**: Tidak dipilih karena akan sangat berisiko untuk aplikasi yang digunakan di lapangan.
