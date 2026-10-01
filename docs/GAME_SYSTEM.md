# Grogon — Game System Document

**Version:** 0.1  
**Status:** DRAFT  
**Related Documents:** PRD.md, DESIGN.md

---

## 1. Game System Overview

Game System merupakan dokumen yang mendefinisikan aturan, mekanisme, dan
perilaku sistem gamifikasi pada aplikasi Grogon.

Grogon merupakan platform latihan soal berbasis gamifikasi. Sistem
gamifikasi digunakan untuk membuat aktivitas latihan menjadi lebih
interaktif, memberikan target kepada pengguna, serta mendorong pengguna
untuk terus menyelesaikan latihan.

Elemen utama gamifikasi Grogon meliputi:

- XP
- Hati
- Diamond
- Progress
- Achievement
- Peringkat
- Turnamen
- Learning Roadmap
- Sistem Unlock

Game System harus tetap mendukung tujuan utama Grogon, yaitu latihan soal
secara bertahap dan terstruktur.

---

# 2. Core Game Loop

Aktivitas utama pengguna dalam Grogon mengikuti siklus:

1. Pengguna memilih bidang latihan.
2. Pengguna melihat roadmap.
3. Pengguna memilih tahapan yang tersedia.
4. Pengguna mengerjakan soal.
5. Sistem memproses jawaban.
6. Sistem memberikan feedback.
7. Sistem memperbarui hasil latihan.
8. Sistem memberikan XP/reward sesuai aturan.
9. Progress pengguna diperbarui.
10. Sistem memeriksa apakah tahapan berikutnya dapat dibuka.
11. Pengguna melanjutkan ke tahapan berikutnya.

Secara sederhana:

```text
Pilih Bidang
     ↓
Lihat Roadmap
     ↓
Pilih Tahapan
     ↓
Kerjakan Soal
     ↓
Jawab
     ↓
Feedback
     ↓
Hasil Latihan
     ↓
XP / Reward
     ↓
Update Progress
     ↓
Cek Unlock
     ↓
Tahapan Berikutnya