# ADR 003: Strategi Integrasi Backend dengan RESTful API

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

Aplikasi Imunetra terdiri dari dua aplikasi Flutter (untuk relawan dan tenaga kesehatan) yang perlu berkomunikasi secara sinkron dengan backend Laravel. Backend bertugas menyimpan data pemeriksaan lapangan, mengatur autentikasi pengguna, serta menganalisis gejala yang terindikasi pneumonia. 

Kebutuhan integrasi antara frontend dan backend meliputi:
- Otentikasi pengguna dengan token.
- Pengiriman data hasil pemeriksaan anak secara terstruktur.
- Pengambilan data diagnosis dari server secara berkala.

## Decision

Tim memilih untuk menggunakan **RESTful API** sebagai strategi komunikasi antara aplikasi Flutter dan backend Laravel.

Dengan pendekatan REST:
- Setiap entitas akan memiliki endpoint HTTP khusus (misalnya: `/api/pemeriksaan`).
- Aplikasi Flutter akan mengirim dan menerima data dalam format JSON.
- Laravel akan memanfaatkan resource controller dan middleware untuk otorisasi dan validasi.

## Consequences

### Keuntungan

- **Kompatibilitas langsung**: Laravel secara native mendukung REST API dengan struktur yang rapi.
- **Mudah digunakan oleh Flutter**: HTTP client seperti `dio` atau `http` package dapat langsung digunakan.
- **Dukungan debugging dan testing yang luas**: Tools seperti Postman, Swagger, dan Insomnia kompatibel.

### Potensi Risiko

- **Data overfetching**: Terutama jika klien tidak butuh seluruh atribut dari resource tertentu.
- **Versi API**: Perlu perencanaan untuk versi API (misalnya: `/api/v1/...`) agar skema tetap kompatibel ke depan.

### Mitigasi

- Menyediakan response API yang efisien dan terstruktur (menggunakan Resource Transformer Laravel).
- Menyusun dokumentasi API internal sejak awal (Swagger/OpenAPI atau Postman Collection).
- Memastikan endpoint REST disertai otorisasi token (Sanctum atau Passport) untuk keamanan.

## Alternatives Considered

- **GraphQL**: Lebih fleksibel dalam fetching data, namun membutuhkan setup dan pembelajaran tambahan di Laravel dan Flutter.
- **Firebase**: Menawarkan solusi backend instan, namun tidak sejalan dengan keputusan sebelumnya untuk menggunakan Laravel dan membutuhkan kendali penuh atas data sensitif.
