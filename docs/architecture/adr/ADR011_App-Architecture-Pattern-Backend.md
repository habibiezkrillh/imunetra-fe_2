# ADR 11: Pemilihan Arsitektur Backend: MVC

## Status  
Accepted

## Date  
14/05/2025

## Decider  
Leonard Widjaja

## Informed  
Aurelia Davine Putri Nata  
Muhammad Habbibie Zikrillah

## Context  

Backend dari sistem **Imunetra** dibangun menggunakan framework **Laravel**, yang secara default menerapkan pendekatan arsitektur **Model-View-Controller (MVC)**. Backend ini bertanggung jawab untuk memproses data dari dua aplikasi mobile (relawan dan tenaga kesehatan), menyimpan data ke database, serta menyediakan API untuk komunikasi data secara aman dan efisien.

Menggunakan MVC pada backend memudahkan strukturisasi kode dan pemisahan tanggung jawab, terutama dalam mengelola logika bisnis, representasi data, dan routing HTTP API. Hal ini penting mengingat backend harus menangani autentikasi, enkripsi data medis, sinkronisasi offline-online, dan pemberian respons cepat ke aplikasi pengguna.

## Decision  

Tim memutuskan untuk menggunakan arsitektur **Model-View-Controller (MVC)** di sisi backend karena Laravel secara native mendukung pola ini dan menyederhanakan pengembangan fitur-fitur REST API yang diperlukan oleh aplikasi mobile Imunetra.

Dalam arsitektur MVC:
- **Model** bertugas menangani data dan logika terkait database, seperti ORM (Eloquent) yang mewakili tabel dan relasi.
- **Controller** mengatur alur aplikasi, menerima request dari client, memprosesnya melalui Model, dan mengembalikan response (biasanya dalam bentuk JSON).
- **View** di Laravel biasa digunakan untuk aplikasi berbasis web, namun dalam konteks REST API, bagian ini umumnya digantikan oleh response format (seperti JSON resources).

## Consequences  

### Keuntungan  

- **Integrasi alami dengan Laravel**: Laravel dirancang dengan MVC, sehingga proses pengembangan menjadi lebih efisien dan konvensi bawaan framework bisa dimanfaatkan maksimal.
- **Keterpisahan tanggung jawab yang jelas**: Memudahkan debugging, pengujian unit (misalnya model atau controller), dan kolaborasi antar developer.
- **Mudah dikembangkan dan dipelihara**: Struktur proyek menjadi rapi dan scalable, cocok untuk tim yang bekerja secara paralel di berbagai fitur backend.

### Potensi Risiko  

- **Duplikasi logika bisnis di beberapa controller**: Tanpa perencanaan yang baik, logika bisa tersebar dan sulit untuk dipusatkan.
- **Keterbatasan fleksibilitas View dalam konteks API**: Karena View di Laravel awalnya dirancang untuk HTML rendering, perlu pendekatan berbeda saat membangun API.

### Mitigasi  

- Menerapkan prinsip DRY (Don't Repeat Yourself) dengan memanfaatkan service class atau repository pattern untuk logika bisnis yang kompleks.
- Menggunakan Laravel Resource/Resource Collection untuk menangani representasi data JSON yang konsisten.
- Menyusun struktur direktori secara terorganisir (misalnya: `App\Models`, `App\Http\Controllers`, dan `App\Http\Resources`) sejak awal proyek.

## Alternatives Considered  

- **Clean Architecture**: Memberikan fleksibilitas dan pemisahan tanggung jawab yang lebih dalam, tetapi terlalu kompleks dan memerlukan banyak boilerplate code untuk tahap awal pengembangan Imunetra.
- **Microservices**: Terlalu berat untuk tahap MVP, serta tidak sejalan dengan kebutuhan proyek yang masih mengandalkan komunikasi terpusat.
