# AI Declaration

## 1. Daftar Alat AI
- **Google Antigravity:** Membantu analisis dan perbaikan kode aplikasi Grogon.
- **ChatGPT:** Membantu penyusunan dokumentasi dan penyusunan prompt untuk pengembangan aplikasi.

## 2. Pemetaan Penggunaan AI dan Pengerjaan Manual

- **Dibantu AI:** Analisis alur kode, perbaikan sistem bintang dan pembukaan node, serta penyusunan dokumentasi proyek.
- **Dikerjakan manual:** Menentukan kebutuhan fitur, memeriksa hasil perubahan AI, memperbaiki ketidaksesuaian ID kategori Supabase dari `perangkat_lunak` menjadi `pplg`, dan memastikan implementasi sesuai kebutuhan aplikasi.

## 3. Studi Kasus Prompting

### Kasus 1: Perbaikan Sistem Bintang dan Pembukaan Node

**Prompt yang digunakan:**

```text
Periksa dan perbaiki sistem bintang serta pembukaan node pada aplikasi Flutter Grogon.

Kondisi saat ini:
- Mode testing _kDebugUnlockAllNodes sudah false.
- Soal dari Supabase sudah berhasil tampil dan bisa dikerjakan.
- Setelah kuis selesai, bintang tidak muncul dan node berikutnya tidak terbuka.

Aturan:
1. Jawaban benar 0–4 dari 10 soal mendapat 0 bintang.
2. Jawaban benar 5–6 mendapat 1 bintang.
3. Jawaban benar 7–9 mendapat 2 bintang.
4. Jawaban benar 10 mendapat 3 bintang.
5. Node berikutnya hanya terbuka jika node sebelumnya mendapat 3 bintang.
6. Jika node terakhir suatu bab mendapat 3 bintang, buka node pertama bab berikutnya.
7. Progres dan bintang harus tersimpan secara persisten.

Telusuri QuizScreen, ResultScreen, model progres, dan roadmap_screen.dart. Periksa perhitungan skor, tampilan bintang, penyimpanan progres, serta syarat pembukaan node.

Sebelum mengubah kode, jelaskan penyebab masalah berdasarkan implementasi yang ada. Lakukan perbaikan seminimal mungkin tanpa mengubah desain UI, warna, layout, isi soal, atau fitur lain yang tidak berkaitan. Jangan mengaktifkan mode testing atau memberikan progres palsu.

Pastikan kompatibel dengan soal dari Supabase dan jalankan flutter analyze setelah perbaikan.
```

**Hasil awal AI:** AI diminta menganalisis alur skor kuis, tampilan bintang, penyimpanan progres, dan logika pembukaan node sebelum melakukan perbaikan.

**Penyesuaian manual:** Saya memeriksa hasil perubahan AI dan memastikan aturan perolehan bintang, pembukaan node, serta penyimpanan progres sesuai dengan kebutuhan aplikasi Grogon.

### Kasus 2: Integrasi Soal dari Supabase

**Prompt yang digunakan:**

Saya menjelaskan kondisi aplikasi Grogon dan struktur database Supabase yang sudah tersedia. Saya kemudian meminta AI memeriksa struktur kode dan mengintegrasikan soal dari Supabase tanpa mengubah tampilan aplikasi, sekaligus menjaga keamanan kunci jawaban.

**Hasil awal AI:** AI membantu menganalisis kode dan mengintegrasikan pengambilan soal dari Supabase.

**Penyesuaian manual:** Saya menemukan ID kategori `perangkat_lunak` pada kode tidak sesuai dengan ID kategori `pplg` di database Supabase. Saya memperbaikinya secara manual agar kode menggunakan ID kategori yang benar.