GROGON --- Product Requirements Document

Status: Draft v0.1
Dokumen: PRD (Product Requirements Document)
Produk: GROGON --- Gamified IT Learning App (Platform Latihan Soal Berbasis Gamifikasi)

“Grogon dikembangkan karena latihan soal konvensional terkadang terasa monoton. Selain itu, pengguna juga terkadang bingung menentukan apa yang ingin dipelajari dan harus mulai dari mana. Oleh karena itu, Grogon hadir dengan konsep learning roadmap dan gamifikasi agar pengguna dapat berlatih soal secara bertahap, lebih terarah, dan menarik.”

1. Product Overview
Grogon adalah platform latihan soal berbasis gamifikasi yang dirancang
untuk membantu pengguna mengasah pengetahuan dan kemampuan melalui
latihan soal yang disajikan secara interaktif dan bertahap.
Grogon menggunakan learning roadmap untuk mengatur urutan bidang dan
tahapan latihan. Pengguna menyelesaikan tahapan yang tersedia sebelum
dapat membuka tahapan atau bidang berikutnya. Setiap bidang memiliki
soal dengan tingkat kesulitan yang meningkat.
Grogon berfokus pada aktivitas menjawab soal, bukan penyediaan
materi pembelajaran dalam bentuk modul atau artikel.

Bidang latihan Grogon meliputi:
Dasar Komputer
Logika & Algoritma
Pemrograman
Pengembangan Perangkat Lunak

Untuk meningkatkan keterlibatan pengguna, Grogon menggunakan elemen
gamifikasi seperti XP, Hati, Diamond, Achievement, Peringkat, dan
Turnamen.

2. Product Vision

Grogon dirancang sebagai platform latihan soal yang interaktif dan
bertahap untuk mendorong pengguna agar lebih konsisten dalam berlatih.

Visi Grogon:

Menjadi platform latihan soal yang interaktif dan memotivasi,
sehingga pengguna terdorong untuk terus berlatih dan meningkatkan
kemampuan secara bertahap.

3. Product Goals

Grogon memiliki tujuan:

Menyediakan platform latihan soal yang interaktif.

Menerapkan sistem gamifikasi untuk meningkatkan keterlibatan
pengguna.

Membangun sistem latihan bertahap berdasarkan bidang dan tingkat
kesulitan.

Menerapkan sistem unlock agar pengguna mengikuti jalur latihan
secara terstruktur.

Menampilkan progress pengguna secara jelas.

Mendorong pengguna agar lebih konsisten dalam berlatih.

Memberikan pengalaman latihan yang lebih menarik dan tidak monoton
dibandingkan latihan soal konvensional.

4. Target Users

Target utama Grogon adalah:

4.1 Siswa SMP

Pengguna yang memiliki ketertarikan terhadap komputer dan ingin mengenal
serta mengasah kemampuan dasar melalui latihan soal.

Kebutuhan: - Soal yang mudah dipahami. - Latihan yang interaktif. -
Tahapan latihan yang bertahap.

Kendala: - Mudah bosan dengan latihan soal yang monoton.

4.2 Siswa SMA/SMK

Khususnya siswa yang memiliki minat pada komputer dan bidang RPL.

Kebutuhan: - Latihan yang terstruktur. - Tingkat kesulitan
bertahap. - Sistem progress.

Kendala: - Membutuhkan motivasi agar konsisten berlatih.

4.3 Mahasiswa

Mahasiswa yang memiliki minat pada komputer dan pengembangan perangkat
lunak.

Kebutuhan: - Latihan yang fleksibel. - Latihan interaktif. -
Tantangan untuk menguji dan memperkuat pemahaman.

Kendala: - Membutuhkan aktivitas latihan yang tidak monoton.

5. User Problems

Grogon dikembangkan untuk membantu mengatasi permasalahan berikut:

Latihan soal terasa monoton
Latihan yang hanya berupa soal dan jawaban dapat membuat pengguna
merasa bosan apabila tidak memiliki interaksi atau variasi.

Kurangnya motivasi untuk berlatih secara konsisten
Pengguna membutuhkan dorongan agar tetap tertarik menyelesaikan
latihan dalam jangka panjang.

Tidak adanya tahapan latihan yang jelas
Pengguna membutuhkan urutan latihan yang terstruktur dari tingkat
dasar menuju tingkat yang lebih sulit.

Sulit mengetahui perkembangan latihan
Pengguna membutuhkan informasi mengenai tahapan yang telah
diselesaikan dan yang masih harus dikerjakan.

Kurangnya tantangan dalam latihan
Pengguna membutuhkan tantangan dan pencapaian agar aktivitas latihan
terasa lebih menarik.

6. User Needs

Pengguna Grogon membutuhkan:

Latihan soal yang interaktif.

Tahapan latihan yang terstruktur.

Sistem progress yang jelas.

Motivasi untuk terus berlatih.

Tantangan dengan tingkat kesulitan yang meningkat.

Feedback setelah menjawab soal.

Sistem pencapaian dan kompetisi seperti XP, Achievement, Peringkat,
dan Turnamen.

7. Core Learning Structure

Grogon menggunakan struktur latihan berbasis bidang dan tahapan.

Bidang Latihan
      ↓
Tahapan
      ↓
Soal
      ↓
Jawaban
      ↓
Feedback
      ↓
Progress
      ↓
Unlock Tahapan/Bidang Berikutnya

Bidang Latihan

1. Dasar Komputer
2. Logika & Algoritma
3. Pemrograman
4. Pengembangan Perangkat Lunak

Setiap bidang terdiri dari beberapa tahapan latihan. Soal disajikan
secara bertahap dengan tingkat kesulitan yang meningkat.

8. Learning Roadmap & Unlock System

Learning Roadmap digunakan untuk menampilkan urutan bidang dan tahapan
latihan yang dapat diselesaikan pengguna.

Sistem unlock mengatur akses pengguna terhadap tahapan dan bidang.

Aturan utama:

Tahapan yang belum memenuhi persyaratan ditampilkan sebagai
terkunci.

Pengguna dapat mengerjakan tahapan yang sudah tersedia.

Penyelesaian tahapan memperbarui progress.

Setelah memenuhi ketentuan penyelesaian, tahapan berikutnya dapat
dibuka.

Pengguna harus menyelesaikan seluruh tahapan pada bidang yang sedang
terbuka sebelum dapat mengakses bidang berikutnya.

Catatan: Persyaratan detail untuk menyatakan sebuah tahapan
selesai belum ditentukan dalam dokumen sumber dan akan ditetapkan pada
tahap perancangan Game System.

9. Core Features

9.1 User Account

Fungsi: - Registrasi. - Login. - Profil pengguna.

9.2 Learning Roadmap

Fungsi: - Menampilkan bidang latihan. - Menampilkan tahapan latihan. -
Menampilkan status tahapan. - Menampilkan progress. - Mengatur unlock
tahapan dan bidang.

9.3 Quiz / Latihan Soal

Fungsi: - Menampilkan soal sesuai tahapan. - Menerima jawaban
pengguna. - Memeriksa jawaban. - Memberikan feedback. - Memperbarui
hasil latihan dan progress.

9.4 XP

XP merupakan poin pengalaman yang diperoleh pengguna berdasarkan
aktivitas dan hasil latihan.

9.5 Hati

Hati digunakan sebagai jumlah kesempatan pengguna dalam mengerjakan
latihan dan dapat berkurang ketika pengguna melakukan kesalahan.

9.6 Diamond

Diamond merupakan aset dalam aplikasi yang dapat diperoleh atau
digunakan sesuai mekanisme Grogon.

9.7 Achievement

Achievement memberikan penghargaan setelah pengguna memenuhi kondisi
pencapaian tertentu.

9.8 Peringkat

Peringkat menampilkan posisi pengguna berdasarkan perolehan XP atau
pencapaian tertentu.

9.9 Turnamen

Turnamen merupakan fitur kompetitif yang memungkinkan pengguna bersaing
berdasarkan hasil latihan.

Fitur turnamen mencakup: - Membuat room. - Menghasilkan kode room. -
Bergabung menggunakan kode room. - Mengikuti pertandingan/kompetisi. -
Menghitung hasil. - Menampilkan peringkat peserta.

9.10 User Profile

Profil menampilkan informasi akun, XP, progress, achievement, dan
pencapaian pengguna.

9.11 Feedback Jawaban

Sistem memberikan informasi kepada pengguna setelah menjawab soal,
termasuk informasi apakah jawaban benar atau salah.

10. User Flow

Alur utama pengguna:

Registrasi / Login
        ↓
Main Menu
        ↓
Melihat Bidang / Learning Roadmap
        ↓
Memilih Tahapan yang Terbuka
        ↓
Mengerjakan Soal
        ↓
Memberikan Jawaban
        ↓
Sistem Memeriksa Jawaban
        ↓
Feedback
        ↓
Hasil Latihan
        ↓
Progress Diperbarui
        ↓
Tahapan Berikutnya Terbuka

Alur turnamen:

Menu Turnamen
      ↓
Buat Room / Bergabung
      ↓
Room Turnamen
      ↓
Peserta Memenuhi Ketentuan
      ↓
Turnamen Dimulai
      ↓
Peserta Menjawab Soal
      ↓
Sistem Menghitung Hasil
      ↓
Hasil & Peringkat

11. User Stories

ID                      User Story              Prioritas

US-01                   Sebagai pengguna, saya  Tinggi
ingin membuat akun dan
masuk ke Grogon
sehingga dapat
menggunakan fitur yang
tersedia.

US-02                   Sebagai pengguna, saya  Tinggi
ingin melihat roadmap
latihan sehingga
mengetahui tahapan yang
dapat saya kerjakan.

US-03                   Sebagai pengguna, saya  Tinggi
ingin mengerjakan soal
sesuai tahapan yang
tersedia sehingga dapat
mengasah kemampuan
saya.

US-04                   Sebagai pengguna, saya  Tinggi
ingin mendapatkan
feedback setelah
menjawab soal sehingga
mengetahui apakah
jawaban saya benar atau
salah.

US-05                   Sebagai pengguna, saya  Tinggi
ingin mendapatkan XP
setelah menyelesaikan
latihan sehingga
memiliki pencapaian
dari aktivitas yang
dilakukan.

US-06                   Sebagai pengguna, saya  Tinggi
ingin melihat progress
latihan sehingga
mengetahui perkembangan
yang telah saya capai.

US-07                   Sebagai pengguna, saya  Sedang
ingin mendapatkan
achievement setelah
memenuhi kondisi
tertentu sehingga
memiliki pencapaian
dalam aplikasi.

US-08                   Sebagai pengguna, saya  Sedang
ingin menggunakan
diamond untuk kebutuhan
tertentu dalam aplikasi
sehingga memiliki
fungsi tambahan dari
reward yang diperoleh.

US-09                   Sebagai pengguna, saya  Sedang
ingin melihat peringkat
sehingga dapat
mengetahui posisi saya
dibandingkan pengguna
lain.

US-10                   Sebagai pengguna, saya  Sedang
ingin mengikuti
turnamen sehingga dapat
mengikuti tantangan
kompetitif dengan
pengguna lain.

US-11                   Sebagai pengguna, saya  Tinggi
ingin bidang latihan
berikutnya terbuka
setelah menyelesaikan
bidang sebelumnya
sehingga memiliki jalur
latihan yang
terstruktur.

12. Product Scope

12.1 In Scope

Akun Pengguna

Registrasi.

Login.

Profil pengguna.

Learning Roadmap

Bidang latihan.

Tahapan latihan.

Status tahapan.

Progress.

Unlock antar-tahapan dan antar-bidang.

Latihan Soal

Menampilkan soal.

Memproses jawaban.

Feedback jawaban.

Tingkat kesulitan bertahap.

Gamifikasi

XP.

Hati.

Diamond.

Achievement.

Peringkat.

Turnamen.

Progress

Menyimpan tahapan yang telah diselesaikan.

Menampilkan perkembangan pengguna.

Membuka tahapan atau bidang berikutnya sesuai ketentuan.

12.2 Out of Scope

Pada tahap awal, Grogon tidak mencakup:

Penyediaan materi pembelajaran dalam bentuk modul atau artikel.

Komunikasi atau chat antar pengguna.

Pembayaran atau transaksi.

Fitur sosial seperti posting dan berbagi konten.

Pembelajaran melalui video.

Kelas secara langsung.

13. Product Constraints

Pengembangan Grogon memiliki batasan:

Waktu Pengembangan
Fitur dikembangkan berdasarkan prioritas karena waktu pengembangan
terbatas.

Sumber Daya Pengembangan
Pengembangan disesuaikan dengan jumlah anggota tim, kemampuan
teknis, dan sumber daya yang tersedia.

Ketersediaan Soal
Jumlah dan variasi soal bergantung pada konten yang berhasil
disiapkan dan dikelola.

Ketergantungan pada Internet
Fitur yang membutuhkan komunikasi dengan server memerlukan koneksi
internet.

Pengembangan Bertahap
Fitur tambahan di luar fitur utama tidak menjadi prioritas tahap
awal dan dapat dikembangkan pada tahap berikutnya.

14. Success Criteria

Grogon dianggap memenuhi tujuan produk apabila:

Pengguna dapat mengakses dan mengerjakan latihan soal sesuai tahapan
yang tersedia.

Pengguna dapat melihat roadmap dan progress latihan.

Sistem dapat memberikan feedback setelah jawaban diberikan.

Sistem dapat memperbarui progress pengguna.

Sistem dapat menerapkan mekanisme unlock.

Elemen gamifikasi utama dapat mendukung aktivitas latihan.

Pengalaman latihan terasa lebih interaktif dan tidak monoton
dibandingkan latihan soal konvensional.

15. Product Decisions Pending

Bagian ini sengaja belum dikunci karena belum ditentukan secara rinci
pada konsep awal.

Quiz

Jumlah soal per tahap.

Jenis soal yang digunakan.

Sistem pengacakan soal.

Batas waktu pengerjaan.

Syarat kelulusan tahap.

Aturan pengulangan tahap.

Gamification

Perhitungan XP.

Batas maksimum Hati.

Cara mendapatkan dan menggunakan Diamond.

Jenis dan syarat Achievement.

Aturan Peringkat.

Turnamen

Jumlah peserta.

Jumlah soal.

Durasi.

Sistem skor.

Aturan pemenang.

Reward turnamen.

Account

Metode autentikasi.

Data profil yang wajib disimpan.

Keputusan pada bagian ini akan ditentukan kemudian dan tidak boleh
diasumsikan oleh implementasi sebelum ditetapkan.

16. Relationship With Other Project Documents

Dokumen project Grogon akan dikembangkan secara bertahap:

PRD.md
  ↓
Menentukan kebutuhan dan konsep produk

DESIGN.md
  ↓
Menentukan tampilan dan aturan UI/UX

GAME_SYSTEM.md
  ↓
Menentukan aturan XP, Hati, Diamond,
Achievement, Progression, Peringkat,
dan Turnamen

ARCHITECTURE.md
  ↓
Menentukan cara teknis aplikasi dibangun

TASKS.md
  ↓
Memecah pekerjaan development menjadi
tugas-tugas yang dapat dikerjakan

CODE
  ↓
Implementasi berdasarkan seluruh dokumen

17. Development Principle

Dokumentasi menjadi acuan sebelum implementasi.
Antigravity tidak boleh mengambil keputusan baru untuk kebutuhan produk
yang belum ditentukan dalam PRD. Jika terdapat kebutuhan atau aturan
yang belum jelas, keputusan tersebut harus ditetapkan terlebih dahulu
sebelum diimplementasikan.
Perubahan terhadap kebutuhan produk harus diperbarui pada dokumentasi
terkait sebelum atau bersamaan dengan perubahan implementasi.

18. Status Document

Current Status: DRAFT

PRD ini belum dianggap final sampai seluruh keputusan produk yang
diperlukan telah ditinjau dan disetujui.