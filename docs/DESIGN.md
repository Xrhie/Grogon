# Grogon — Design Document

**Version:** 0.1  
**Status:** DRAFT  
**Related Document:** PRD.md

---

## 1. Design Overview

DESIGN.md mendefinisikan rancangan UI/UX aplikasi Grogon, termasuk struktur
halaman, navigasi, komponen antarmuka, visual style, interaction, dan
responsive behavior.

Dokumen ini menjadi acuan dalam proses implementasi antarmuka Grogon.

---

## 2. Design Goals

Desain Grogon memiliki tujuan:

1. Membuat aplikasi mudah digunakan oleh pengguna.
2. Menampilkan proses belajar dalam bentuk roadmap yang jelas.
3. Membuat aktivitas latihan soal terasa seperti sebuah permainan.
4. Menampilkan perkembangan pengguna secara mudah dipahami.
5. Menjaga antarmuka tetap sederhana meskipun memiliki banyak elemen gamifikasi.
6. Memberikan pengalaman yang konsisten pada seluruh halaman aplikasi.

---

## 3. Target Experience

Pengguna diharapkan dapat:

- memahami fungsi setiap menu tanpa penjelasan panjang;
- mengetahui materi atau bidang yang sedang dikerjakan;
- mengetahui tahapan yang sudah dan belum terbuka;
- mengerjakan soal dengan fokus;
- melihat hasil latihan dan perkembangan;
- memahami status XP, hati, diamond, achievement, dan peringkat;
- berpindah antarhalaman dengan mudah.

---

## 4. Visual Direction

### 4.1 Design Theme

Arah visual Grogon:

- Dark
- Gaming
- Education
- Technology
- Modern
- Simple
- Interactive

Desain menggunakan pendekatan visual yang memberikan kesan aplikasi
pembelajaran berbasis game, bukan aplikasi pembelajaran konvensional.

### 4.2 Color System

Warna utama dan warna pendukung akan ditentukan berdasarkan desain UI final.

Status:

- Primary Color: TBD
- Secondary Color: TBD
- Background Color: TBD
- Surface/Card Color: TBD
- Text Primary: TBD
- Text Secondary: TBD
- Success: TBD
- Error: TBD
- Warning: TBD
- Locked/Disabled: TBD

> Nilai warna final tidak ditentukan pada versi awal dokumen ini dan akan
> mengikuti desain UI yang telah disepakati.

---

## 5. Typography

Font yang digunakan akan ditentukan berdasarkan desain final.

Hierarchy:

- Display / Heading
- Section Heading
- Body
- Caption
- Button / Label
- Statistic

Status:

- Font Family: TBD
- Heading Style: TBD
- Body Style: TBD
- Number/Statistic Style: TBD

---

## 6. Navigation Structure

Navigasi utama Grogon terdiri dari:

1. Menu / Beranda
2. Peringkat
3. Profil

Navigasi tambahan dapat muncul sesuai kebutuhan fitur, seperti:

- Roadmap
- Quiz
- Hasil latihan
- Achievement
- Tournament

Struktur navigasi final mengikuti hasil desain UI/UX.

---

## 7. Screen Structure

### 7.1 Main Menu

Main Menu merupakan halaman utama pengguna.

Informasi yang ditampilkan dapat meliputi:

- XP
- Diamond
- Hati
- pilihan bidang pembelajaran
- akses tournament
- navigasi utama

Tujuan halaman:

- memberikan akses cepat ke aktivitas utama;
- menunjukkan status gamifikasi pengguna;
- memberikan akses ke bidang pembelajaran.

---

### 7.2 Learning Area Selection

Halaman ini menampilkan bidang pembelajaran Grogon:

1. Dasar Komputer
2. Logika & Algoritma
3. Pemrograman
4. Pengembangan Perangkat Lunak

Setiap bidang ditampilkan sebagai elemen yang dapat dipilih pengguna.

Status bidang dapat berupa:

- Available
- Locked
- Completed

Aturan unlock mengikuti PRD.md.

---

### 7.3 Learning Roadmap

Roadmap menampilkan urutan tahapan pembelajaran dalam bentuk visual
berurutan.

Elemen yang dapat ditampilkan:

- node/tahapan;
- status unlocked;
- status locked;
- status completed;
- progress;
- indikator tahapan aktif.

Roadmap harus membantu pengguna memahami:

> "Saya sedang berada di mana dan apa yang harus saya selesaikan berikutnya?"

---

### 7.4 Quiz Screen

Quiz merupakan halaman utama untuk aktivitas latihan soal.

Komponen utama:

- indikator progress soal;
- pertanyaan;
- pilihan jawaban;
- tombol jawaban/submit;
- indikator hati;
- feedback jawaban.

Desain harus meminimalkan distraksi agar pengguna fokus mengerjakan soal.

---

### 7.5 Quiz Result

Halaman hasil latihan menampilkan hasil setelah pengguna menyelesaikan
latihan.

Informasi dapat meliputi:

- hasil latihan;
- XP yang diperoleh;
- perubahan progress;
- achievement yang diperoleh;
- tombol untuk melanjutkan.

Detail visual akan ditentukan pada desain final.

---

### 7.6 Ranking

Halaman ranking menampilkan posisi pengguna dibandingkan pengguna lainnya.

Komponen dapat meliputi:

- posisi pengguna;
- daftar ranking;
- XP atau parameter ranking;
- periode ranking.

Detail mekanisme ranking ditentukan pada GAME_SYSTEM.md.

---

### 7.7 Tournament

Halaman tournament digunakan untuk mengakses fitur kompetisi.

Komponen dapat meliputi:

- tournament yang tersedia;
- status tournament;
- informasi peserta;
- progress/hasil tournament;
- leaderboard tournament.

Detail aturan tournament ditentukan pada GAME_SYSTEM.md.

---

### 7.8 Profile

Halaman profil menampilkan informasi pengguna.

Komponen dapat meliputi:

- username;
- statistik pengguna;
- progress;
- achievement;
- informasi akun;
- pengaturan.

Detail final mengikuti desain UI yang akan ditentukan.

---

## 8. Gamification UI

Elemen gamifikasi harus memiliki visual yang mudah dibedakan.

Elemen utama:

| Elemen | Fungsi |
|---|---|
| XP | Menunjukkan pengalaman/progress pengguna |
| Hati | Menunjukkan kesempatan dalam latihan |
| Diamond | Mata uang/reward dalam sistem game |
| Achievement | Menunjukkan pencapaian pengguna |
| Ranking | Menunjukkan posisi pengguna |
| Tournament | Menunjukkan kompetisi |

Ikon, warna, animasi, dan bentuk masing-masing elemen akan ditentukan pada
desain final.

---

## 9. Components

Komponen UI yang kemungkinan digunakan:

- App Bar
- Bottom Navigation
- Card
- Button
- Progress Bar
- Progress Indicator
- Roadmap Node
- Quiz Option
- Statistic Card
- Achievement Badge
- Ranking Item
- Tournament Card
- Dialog
- Snackbar / Feedback Message

Komponen final akan disesuaikan dengan desain UI.

---

## 10. Interaction Design

Interaksi harus memberikan feedback yang jelas kepada pengguna.

Contoh:

- pilihan jawaban berubah ketika dipilih;
- jawaban benar/salah mendapatkan feedback;
- tahapan berubah status setelah selesai;
- progress diperbarui setelah latihan;
- reward ditampilkan setelah aktivitas selesai;
- item yang terkunci menunjukkan alasan/status locked;
- tombol memberikan visual feedback ketika ditekan.

Animasi tidak boleh mengganggu proses menjawab soal.

---

## 11. State Design

Komponen yang memiliki status harus memiliki visual berbeda.

Contoh:

### Roadmap

- Locked
- Available
- Active
- Completed

### Quiz Answer

- Default
- Selected
- Correct
- Incorrect
- Disabled

### Button

- Default
- Pressed
- Disabled
- Loading

---

## 12. Responsive Design

Grogon ditujukan terutama untuk perangkat mobile.

Prioritas:

1. Mobile portrait
2. Tablet
3. Ukuran layar lainnya jika diperlukan

Antarmuka harus tetap dapat digunakan pada berbagai ukuran layar tanpa
menghilangkan informasi penting.

---

## 13. Accessibility

Desain perlu memperhatikan:

- ukuran teks yang mudah dibaca;
- kontras yang cukup;
- ukuran area tombol yang nyaman disentuh;
- feedback tidak hanya bergantung pada warna;
- navigasi yang konsisten;
- informasi penting tidak hanya disampaikan melalui ikon.

---

## 14. Design Assets

Asset yang diperlukan dapat meliputi:

- icon;
- illustration;
- achievement badge;
- tournament illustration;
- roadmap elements;
- game-related assets;
- logo Grogon.

Asset final akan ditentukan setelah desain UI final tersedia.

---

## 15. Design References

Referensi utama desain berasal dari:

- konsep aplikasi Grogon;
- desain/whiteframe yang telah dibuat;
- pendekatan aplikasi quiz gamifikasi;
- konsep roadmap pembelajaran.

Referensi tidak digunakan untuk menyalin desain secara langsung, tetapi sebagai
acuan dalam menentukan pengalaman pengguna Grogon.

---

## 16. Pending Design Decisions

Bagian ini akan diperbarui setelah desain UI final tersedia.

- [ ] Final color palette
- [ ] Final typography
- [ ] Final icon system
- [ ] Final button style
- [ ] Final card style
- [ ] Final roadmap design
- [ ] Final quiz interface
- [ ] Final ranking interface
- [ ] Final tournament interface
- [ ] Final profile interface
- [ ] Animation/micro-interaction
- [ ] Empty states
- [ ] Loading states
- [ ] Error states

---

## 17. Design Status

**Status:** DRAFT

Dokumen ini belum menjadi acuan implementasi final sampai seluruh keputusan
desain utama telah disepakati.