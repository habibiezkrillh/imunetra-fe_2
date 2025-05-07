# Architecture Decision Log (ADL)

Dokumen ini berisi daftar seluruh keputusan arsitektur yang telah diambil dalam proyek ini. Setiap keputusan dijelaskan dalam file ADR terpisah.

---

## ADR 001 - App Architecture Pattern
- **Status**: Accepted
- **Date**: 07/05/2025
- **Decider**: Muhammad Habbibie Zikrillah
- **Summary**: Tim memilih arsitektur **MVVM** (Model-View-ViewModel) untuk aplikasi Imunetra untuk memisahkan logika presentasi, data, dan antarmuka pengguna, sehingga mempermudah pemeliharaan dan pengujian aplikasi.

---

## ADR 002 - State Management Approach
- **Status**: Accepted
- **Date**: 07/05/2025
- **Decider**: Leonard Widjaja
- **Summary**: Tim memilih **BLoC** sebagai solusi untuk pengelolaan state aplikasi, karena kemampuannya dalam menangani aliran data yang kompleks, serta adanya dokumentasi yang baik dan komunitas yang kuat.

---

## ADR 003 - Backend Integration Strategy
- **Status**: Proposed
- **Date**: 07/05/2025
- **Decider**: Leonard Widjaja
- **Summary**: Tim memilih menggunakan RESTful API sebagai strategi komunikasi antara aplikasi Flutter dan backend Laravel.

---

## ADR 004 - Local Data Persistence
- **Status**: Proposed
- **Date**: 07/05/2025
- **Decider**: Leonard Widjaja
- **Summary**: Tim memilih untuk menggunakan **SQLite** sebagai mekanisme penyimpanan data lokal di aplikasi, memberikan solusi yang baik untuk caching dan pengelolaan data offline.

---

## ADR 005 - Dependency Injection Framework
- **Status**: Accepted
- **Date**: 07/05/2025
- **Decider**: Leonard Widjaja
- **Summary**: Tim memilih menggunakan kombinasi **GetIt** dan **injectable** sebagai solusi dependency injection di aplikasi Imunetra.

---

## ADR 006 - Navigation & Routing Solution
- **Status**: Proposed
- **Date**: 07/05/2025
- **Decider**: Aurelia Davine Putri Nata  
- **Summary**: Tim memutuskan untuk menggunakan **go_router** sebagai solusi routing utama.

---

## ADR 007 - Theming & UI Styling 
- **Status**: Proposed
- **Date**: 07/05/2025
- **Decider**: Muhammad Habbibie Zikrillah  
- **Summary**: Tim memutuskan untuk menggunakan **Material Theming Flutter** yang dikustomisasi sesuai identitas visual Imunetra.

---

## ADR 008 - Offline Support & Caching
- **Status**: Accepted
- **Date**: 07/05/2025
- **Decider**: Aurelia Davine Putri Nata 
- **Summary**: Tim memutuskan untuk menggunakan pendekatan **Local-First dengan Layer Cache Manual** dimana data penting akan disimpan di penyimpanan lokal terlebih dahulu.

---

## ADR 009 - Error Handling & Monitoring
- **Status**: Accepted
- **Date**: 07/05/2025
- **Decider**: Aurelia Davine Putri Nata  
- **Summary**: Memilih **Sentry** untuk menangani pelaporan error dan monitoring aplikasi, guna mendeteksi dan merespons masalah dengan lebih efisien.

---

## ADR 010 - Testing Strategy & CI/CD Pipeline
- **Status**: Proposed
- **Date**: 07/05/2025
- **Decider**: Muhammad Habbibie Zikrillah  
- **Summary**: Menunda implementasi **CI/CD pipeline** dan **testing otomatis** (unit, widget, integration tests) untuk saat ini, dan lebih fokus pada **manual testing** di perangkat Android hingga aplikasi stabil.



