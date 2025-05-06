# ADR 003: Menggunakan RESTful API dengan Laravel sebagai Backend

Date: 2025-05-06

## Status

🟢 **Accepted**

## Context

Komunikasi data antara frontend dengan backend perlu konsisten dan fleksibel, sehingga kita mengusulkan Laravel 11 sebagai backend nya

## Decision

Gunakan pendekatan **REST API** (GET/POST/PUT/DELETE) sebagai metode komunikasi antara frontend (Flutter) dan backend (Laravel)

## Consequences

+ Mudah untuk testing
- Perlu dipertimbangkan karena kita akan ada fitur chat yang bersifat real-time (coba menggunakan WebSocket untuk sistem chat nya nanti).
