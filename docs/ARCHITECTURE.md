# Grogon — System Architecture Document

**Version:** 0.1  
**Status:** DRAFT  
**Related Documents:** PRD.md, DESIGN.md, GAME_SYSTEM.md

---

# 1. Architecture Overview

Grogon menggunakan arsitektur **client-server**, di mana aplikasi pengguna berkomunikasi dengan server untuk memproses aktivitas dan mengelola data aplikasi.

Arsitektur Grogon terdiri dari beberapa komponen utama:

- Client / Frontend
- Backend / API
- Database
- Authentication
- Learning & Game Logic

Pengguna berinteraksi melalui aplikasi untuk melakukan login, melihat roadmap, memilih tahapan, mengerjakan soal, melihat hasil, serta memantau progress dan pencapaian.

Server bertugas memproses permintaan dari aplikasi, menjalankan aturan sistem, dan mengelola data yang tersimpan pada database.

Secara umum, hubungan antar komponen adalah:

```text
┌───────────────────────┐
│        USER           │
│    Pengguna Grogon    │
└───────────┬───────────┘
            │
            ▼
┌───────────────────────┐
│   CLIENT / FRONTEND   │
│    Aplikasi Grogon    │
└───────────┬───────────┘
            │
            │ API Request
            ▼
┌───────────────────────┐
│      BACKEND / API    │
│    Application Server  │
└───────────┬───────────┘
            │
       ┌────┴─────┐
       ▼          ▼
┌───────────┐ ┌───────────────┐
│ LEARNING & │ │   DATABASE    │
│ GAME LOGIC │ │               │
│            │ │ User, Soal,   │
│            │ │ Progress, dll │
└────────────┘ └───────────────┘