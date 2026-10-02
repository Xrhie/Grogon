import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../shared/app_theme.dart';
import '../home/widgets/home_header.dart';
import '../quiz/widgets/quiz_pre_start_sheet.dart';
import '../quiz/services/quiz_service.dart';
import '../quiz/services/progress_service.dart';

// ─────────────────────────────────────────────────────────────────────────────
// DEBUG MODE — Hanya berlaku saat kDebugMode == true (flutter run, bukan release)
// Ubah nilai di bawah ini untuk mengaktifkan / menonaktifkan mode testing.
//
//   true  → Semua 25 node Dasar Komputer terbuka sebagai NodeState.current
//            (hanya untuk melihat tampilan Roadmap, tidak mengubah progres asli)
//   false → Kondisi normal: progres dibaca dari penyimpanan lokal
// ─────────────────────────────────────────────────────────────────────────────
const bool _kDebugUnlockAllNodes = true;

enum NodeState { completed, current, locked }

// Daftar seluruh node Dasar Komputer dalam urutan linear
const _dkNodes = [
  'dk_b1_n1', 'dk_b1_n2', 'dk_b1_n3', 'dk_b1_n4', 'dk_b1_n5',
  'dk_b2_n1', 'dk_b2_n2', 'dk_b2_n3', 'dk_b2_n4', 'dk_b2_n5',
  'dk_b3_n1', 'dk_b3_n2', 'dk_b3_n3', 'dk_b3_n4', 'dk_b3_n5',
  'dk_b4_n1', 'dk_b4_n2', 'dk_b4_n3', 'dk_b4_n4', 'dk_b4_n5',
  'dk_b5_n1', 'dk_b5_n2', 'dk_b5_n3', 'dk_b5_n4', 'dk_b5_n5',
];

// Daftar seluruh node Logika & Algoritma
// dalam urutan linear
const _laNodes = [
  // BAB 1
  'la_b1_n1', 'la_b1_n2', 'la_b1_n3', 'la_b1_n4', 'la_b1_n5',
  // BAB 2
  'la_b2_n1', 'la_b2_n2', 'la_b2_n3', 'la_b2_n4', 'la_b2_n5',
  // BAB 3
  'la_b3_n1', 'la_b3_n2', 'la_b3_n3', 'la_b3_n4', 'la_b3_n5',
  // BAB 4
  'la_b4_n1', 'la_b4_n2', 'la_b4_n3', 'la_b4_n4', 'la_b4_n5',
  // BAB 5
  'la_b5_n1', 'la_b5_n2', 'la_b5_n3', 'la_b5_n4', 'la_b5_n5',
];

const _pmNodes = [
  // BAB 1: PENGENALAN PEMROGRAMAN
  'pm_b1_n1', 'pm_b1_n2', 'pm_b1_n3', 'pm_b1_n4', 'pm_b1_n5',
  // BAB 2: VARIABEL DAN TIPE DATA
  'pm_b2_n1', 'pm_b2_n2', 'pm_b2_n3', 'pm_b2_n4', 'pm_b2_n5',
  // BAB 3: STRUKTUR KONTROL PROGRAM
  'pm_b3_n1', 'pm_b3_n2', 'pm_b3_n3', 'pm_b3_n4', 'pm_b3_n5',
  // BAB 4: FUNGSI DAN STRUKTUR DATA
  'pm_b4_n1', 'pm_b4_n2', 'pm_b4_n3', 'pm_b4_n4', 'pm_b4_n5',
  // BAB 5: MEMBANGUN PROGRAM SEDERHANA
  'pm_b5_n1', 'pm_b5_n2', 'pm_b5_n3', 'pm_b5_n4', 'pm_b5_n5',
];

const _pplgNodes = [
  // BAB 1: DASAR PENGEMBANGAN PERANGKAT LUNAK DAN GIM
  'pplg_b1_n1', 'pplg_b1_n2', 'pplg_b1_n3', 'pplg_b1_n4', 'pplg_b1_n5',
  // BAB 2: ANALISIS DAN PERANCANGAN SISTEM
  'pplg_b2_n1', 'pplg_b2_n2', 'pplg_b2_n3', 'pplg_b2_n4', 'pplg_b2_n5',
  // BAB 3: PROSES PENGEMBANGAN PERANGKAT LUNAK
  'pplg_b3_n1', 'pplg_b3_n2', 'pplg_b3_n3', 'pplg_b3_n4', 'pplg_b3_n5',
  // BAB 4: PENGUJIAN DAN PENGELOLAAN KODE
  'pplg_b4_n1', 'pplg_b4_n2', 'pplg_b4_n3', 'pplg_b4_n4', 'pplg_b4_n5',
  // BAB 5: DEPLOYMENT DAN PEMELIHARAAN
  'pplg_b5_n1', 'pplg_b5_n2', 'pplg_b5_n3', 'pplg_b5_n4', 'pplg_b5_n5',
];

class RoadmapScreen extends StatefulWidget {
  final String title;
  final String categoryId;

  const RoadmapScreen({
    super.key,
    required this.title,
    required this.categoryId,
  });

  @override
  State<RoadmapScreen> createState() => _RoadmapScreenState();
}

class _RoadmapScreenState extends State<RoadmapScreen> {
  /// Peta bintang per nodeId. Kosong berarti sedang memuat.
  Map<String, int> _starsMap = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }


  Future<void> _loadProgress() async {
    if (!mounted) return;
    setState(() => _loading = true);

    final nodeIds = switch (widget.categoryId) {
      'dasar_komputer' => _dkNodes,
      'logika_algoritma' => _laNodes,
      'pemrograman' => _pmNodes,
      'pplg' => _pplgNodes,
      _ => <String>[],
    };
    final map = await ProgressService.getStarsForNodes(widget.categoryId, nodeIds);

    if (mounted) {
      setState(() {
        _starsMap = map;
        _loading = false;
      });
    }
  }

  // ─── Logika state node ────────────────────────────────────────────────────
  /// Mengembalikan NodeState untuk sebuah node berdasarkan progres tersimpan.
  /// Aturan:
  ///   - Node pertama (dk_b1_n1) selalu minimal "current" jika belum selesai.
  ///   - Node N terbuka (current) jika node N-1 mendapat 3 bintang.
  ///   - Node N selesai (completed) jika node itu sendiri mendapat ≥ 1 bintang.
  ///   - Semua node terbuka (current) jika debug mode aktif.
  NodeState _nodeState(String nodeId) {
    if (kDebugMode && _kDebugUnlockAllNodes) {
      return NodeState.current;
    }

    final stars = _starsMap[nodeId] ?? 0;

    // Node sudah diselesaikan (punya bintang)
    if (stars > 0) {
      return NodeState.completed;
    }

    // Tentukan daftar node berdasarkan kategori
    final nodes = switch (widget.categoryId) {
      'dasar_komputer' => _dkNodes,
      'logika_algoritma' => _laNodes,
      'pemrograman' => _pmNodes,
      'pplg' => _pplgNodes,
      _ => <String>[],
    };

    // Node pertama selalu terbuka
    if (nodes.isNotEmpty && nodeId == nodes.first) {
      return NodeState.current;
    }

    // Cek apakah node sebelumnya mendapat 3 bintang
    final idx = nodes.indexOf(nodeId);

    if (idx > 0) {
      final prevStars = _starsMap[nodes[idx - 1]] ?? 0;

      if (prevStars == 3) {
        return NodeState.current;
      }
    }

    return NodeState.locked;
  }
  // ─── Helpers teks ─────────────────────────────────────────────────────────
  String _getChapterTitleForNode(String nodeId) {
    if (nodeId.startsWith('dk_b1')) return 'BAB 1: SEJARAH KOMPUTER';
    if (nodeId.startsWith('dk_b2')) return 'BAB 2: KOMPONEN KOMPUTER';
    if (nodeId.startsWith('dk_b3')) return 'BAB 3: HARDWARE SOFTWARE';
    if (nodeId.startsWith('dk_b4')) return 'BAB 4: SISTEM BILANGAN';
    if (nodeId.startsWith('dk_b5')) return 'BAB 5: SISTEM OPERASI';
    if (nodeId.startsWith('la_b1')) return 'BAB 1: PENGENALAN LOGIKA';
    if (nodeId.startsWith('pplg_b1')) return 'BAB 1: DASAR PENGEMBANGAN PERANGKAT LUNAK DAN GIM';
    if (nodeId.startsWith('pplg_b2')) return 'BAB 2: ANALISIS DAN PERANCANGAN SISTEM';
    if (nodeId.startsWith('pplg_b3')) return 'BAB 3: PROSES PENGEMBANGAN PERANGKAT LUNAK';
    if (nodeId.startsWith('pplg_b4')) return 'BAB 4: PENGUJIAN DAN PENGELOLAAN KODE';
    if (nodeId.startsWith('pplg_b5')) return 'BAB 5: DEPLOYMENT DAN PEMELIHARAAN';
    return 'BAB 1: DASAR-DASAR';
  }

  String _getDescriptionForNode(String nodeId) {
    switch (nodeId) {
      case 'dk_b1_n1':
        return 'Memahami ENIAC dan tabung hampa udara pada komputer 1940-an.';
      case 'dk_b1_n2':
        return 'Mempelajari penemuan transistor dan sirkuit terintegrasi (IC) yang merevolusi ukuran komputer.';
      case 'dk_b1_n3':
        return 'Era di mana komputer mulai masuk ke rumah-rumah dengan mikroprosesor modern.';
      case 'dk_b2_n1':
        return 'Memahami komponen inti dari sistem komputer seperti ALU, Control Unit, dan Register.';
      default:
        return 'Selesaikan tantangan kuis ini untuk menguji pemahaman kamu dan mendapatkan reward.';
    }
  }

  // ─── Tap node ─────────────────────────────────────────────────────────────
  void _onNodeTap(String nodeId, String nodeTitle, NodeState state) async {
    if (state == NodeState.locked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tahapan ini masih terkunci!')),
      );
      return;
    }

    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(color: AppColors.neonGreen),
      ),
    );

    try {
      final quizService = QuizService();
      final questions =
          await quizService.getQuestionsByNode(widget.categoryId, nodeId);

      if (!mounted) return;
      Navigator.pop(context); // tutup loading

      if (questions.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Belum ada soal untuk modul ini.')),
        );
        return;
      }

      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (ctx) => QuizPreStartSheet(
          chapterTitle: _getChapterTitleForNode(nodeId),
          quizTitle: nodeTitle,
          description: _getDescriptionForNode(nodeId),
          categoryId: widget.categoryId,
          nodeId: nodeId,
          questions: questions,
        ),
      );

      // Refresh setelah kembali dari kuis
      _loadProgress();
    } catch (e) {
      if (!mounted) return;
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memuat soal: $e')),
      );
    }
  }

  // ─── Build UI ─────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back,
                        color: AppColors.neonGreen, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.2,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const HomeHeader(),

            // Roadmap Scrolling Area
            Expanded(
              child: _loading
                  ? const Center(
                      child: CircularProgressIndicator(
                          color: AppColors.neonGreen),
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: _buildRoadmapContent(),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildRoadmapContent() {
    // ROADMAP DASAR KOMPUTER
    if (widget.categoryId == 'dasar_komputer') {
      return [
        _buildChapterHeader('BAB 1: SEJARAH KOMPUTER'),
        const SizedBox(height: 30),
        _buildNode(id: 'dk_b1_n1', title: 'Generasi Pertama', offsetX: 0),
        _buildNode(id: 'dk_b1_n2', title: 'Revolusi Transistor', offsetX: -60),
        _buildNode(id: 'dk_b1_n3', title: 'Era Mikroprosesor', offsetX: 60),
        _buildNode(id: 'dk_b1_n4', title: 'Generasi Kelima', offsetX: -60),
        _buildNode(id: 'dk_b1_n5', title: 'Komputer Modern', offsetX: 0),

        const SizedBox(height: 20),
        _buildChapterHeader('BAB 2: KOMPONEN KOMPUTER'),
        const SizedBox(height: 30),
        _buildNode(id: 'dk_b2_n1', title: 'Anatomi CPU', offsetX: 0),
        _buildNode(id: 'dk_b2_n2', title: 'Memori Utama', offsetX: -60),
        _buildNode(id: 'dk_b2_n3', title: 'Media Penyimpanan', offsetX: 60),
        _buildNode(id: 'dk_b2_n4', title: 'Perangkat Input', offsetX: -60),
        _buildNode(id: 'dk_b2_n5', title: 'Perangkat Output', offsetX: 0),

        const SizedBox(height: 20),
        _buildChapterHeader('BAB 3: HARDWARE SOFTWARE'),
        const SizedBox(height: 30),
        _buildNode(id: 'dk_b3_n1', title: 'Dasar Hardware', offsetX: 0),
        _buildNode(id: 'dk_b3_n2', title: 'Jenis Hardware', offsetX: -60),
        _buildNode(id: 'dk_b3_n3', title: 'Dasar Software', offsetX: 60),
        _buildNode(id: 'dk_b3_n4', title: 'Jenis Software', offsetX: -60),
        _buildNode(id: 'dk_b3_n5', title: 'Integrasi Sistem', offsetX: 0),

        const SizedBox(height: 20),
        _buildChapterHeader('BAB 4: SISTEM BILANGAN'),
        const SizedBox(height: 30),
        _buildNode(id: 'dk_b4_n1', title: 'Bilangan Biner', offsetX: 0),
        _buildNode(id: 'dk_b4_n2', title: 'Bilangan Desimal', offsetX: -60),
        _buildNode(id: 'dk_b4_n3', title: 'Bilangan Oktal', offsetX: 60),
        _buildNode(id: 'dk_b4_n4', title: 'Bilangan Heksadesimal', offsetX: -60),
        _buildNode(id: 'dk_b4_n5', title: 'Konversi Bilangan', offsetX: 0),

        const SizedBox(height: 20),
        _buildChapterHeader('BAB 5: SISTEM OPERASI'),
        const SizedBox(height: 30),
        _buildNode(id: 'dk_b5_n1', title: 'Dasar Sistem', offsetX: 0),
        _buildNode(id: 'dk_b5_n2', title: 'Jenis Sistem', offsetX: -60),
        _buildNode(id: 'dk_b5_n3', title: 'Manajemen File', offsetX: 60),
        _buildNode(id: 'dk_b5_n4', title: 'Keamanan Komputer', offsetX: -60),
        _buildNode(id: 'dk_b5_n5', title: 'Perawatan Komputer', offsetX: 0),
      ];
    }

    // ROADMAP LOGIKA DAN ALGORITMA
    if (widget.categoryId == 'logika_algoritma') {
      return [
        _buildChapterHeader('BAB 1: DASAR LOGIKA DAN ALGORITMA'),
        const SizedBox(height: 30),
        _buildNode(id: 'la_b1_n1', title: 'Logika Dasar', offsetX: 0),
        _buildNode(id: 'la_b1_n2', title: 'Pernyataan Logika', offsetX: -60),
        _buildNode(id: 'la_b1_n3', title: 'Operator Logika', offsetX: 60),
        _buildNode(id: 'la_b1_n4', title: 'Konsep Algoritma', offsetX: -60),
        _buildNode(id: 'la_b1_n5', title: 'Urutan Algoritma', offsetX: 0),

        const SizedBox(height: 20),
        _buildChapterHeader('BAB 2: FLOWCHART DAN PSEUDOCODE'),
        const SizedBox(height: 30),
        _buildNode(id: 'la_b2_n1', title: 'Pengertian Flowchart', offsetX: 0),
        _buildNode(id: 'la_b2_n2', title: 'Simbol Flowchart', offsetX: -60),
        _buildNode(id: 'la_b2_n3', title: 'Struktur Flowchart', offsetX: 60),
        _buildNode(id: 'la_b2_n4', title: 'Dasar Pseudocode', offsetX: -60),
        _buildNode(id: 'la_b2_n5', title: 'Menyusun Algoritma', offsetX: 0),

        const SizedBox(height: 20),
        _buildChapterHeader('BAB 3: VARIABEL DAN TIPE DATA'),
        const SizedBox(height: 30),
        _buildNode(id: 'la_b3_n1', title: 'Pengertian Variabel', offsetX: 0),
        _buildNode(id: 'la_b3_n2', title: 'Tipe Data', offsetX: -60),
        _buildNode(id: 'la_b3_n3', title: 'Konstanta', offsetX: 60),
        _buildNode(id: 'la_b3_n4', title: 'Operator Aritmatika', offsetX: -60),
        _buildNode(id: 'la_b3_n5', title: 'Input dan Output', offsetX: 0),

        const SizedBox(height: 20),
        _buildChapterHeader('BAB 4: PERCABANGAN DAN PERULANGAN'),
        const SizedBox(height: 30),
        _buildNode(id: 'la_b4_n1', title: 'Percabangan IF', offsetX: 0),
        _buildNode(id: 'la_b4_n2', title: 'IF-ELSE', offsetX: -60),
        _buildNode(id: 'la_b4_n3', title: 'Nested IF', offsetX: 60),
        _buildNode(id: 'la_b4_n4', title: 'Perulangan FOR', offsetX: -60),
        _buildNode(id: 'la_b4_n5', title: 'Perulangan WHILE', offsetX: 0),

        const SizedBox(height: 20),
        _buildChapterHeader('BAB 5: PEMECAHAN MASALAH'),
        const SizedBox(height: 30),
        _buildNode(id: 'la_b5_n1', title: 'Analisis Masalah', offsetX: 0),
        _buildNode(id: 'la_b5_n2', title: 'Menyusun Solusi', offsetX: -60),
        _buildNode(id: 'la_b5_n3', title: 'Menelusuri Algoritma', offsetX: 60),
        _buildNode(id: 'la_b5_n4', title: 'Menguji Algoritma', offsetX: -60),
        _buildNode(id: 'la_b5_n5', title: 'Tantangan Algoritma', offsetX: 0),
      ];
    }
    
    // ROADMAP PEMROGRAMAN
    if (widget.categoryId == 'pemrograman') {
      return [
        // BAB 1: PENGENALAN PEMROGRAMAN
        _buildChapterHeader('BAB 1: PENGENALAN PEMROGRAMAN'),
        const SizedBox(height: 30),

        _buildNode(id: 'pm_b1_n1', title: 'Pengatar Pemrograman', offsetX: 0),
        _buildNode(id: 'pm_b1_n2', title: 'Bahasa Pemrograman', offsetX: -60),
        _buildNode(id: 'pm_b1_n3', title: 'Kode dan Sintaks', offsetX: 60),
        _buildNode(id: 'pm_b1_n4', title: 'Cara Kerja Program', offsetX: -60),
        _buildNode(id: 'pm_b1_n5', title: 'Compiler dan Interpreter', offsetX: 0),

        const SizedBox(height: 20),

        // BAB 2: VARIABEL DAN TIPE DATA
        _buildChapterHeader('BAB 2: VARIABEL DAN TIPE DATA'),
        const SizedBox(height: 30),

        _buildNode(id: 'pm_b2_n1', title: 'Variabel dan Konstanta', offsetX: 0),
        _buildNode(id: 'pm_b2_n2', title: 'Tipe Data Dasar', offsetX: -60),
        _buildNode(id: 'pm_b2_n3', title: 'Deklarasi Variabel', offsetX: 60),
        _buildNode(id: 'pm_b2_n4', title: 'Operator Aritmatika', offsetX: -60),
        _buildNode(id: 'pm_b2_n5', title: 'Operator dan Ekspresi', offsetX: 0),

        const SizedBox(height: 20),

        // BAB 3: STRUKTUR KONTROL PROGRAM
        _buildChapterHeader('BAB 3: STRUKTUR KONTROL PROGRAM'),
        const SizedBox(height: 30),

        _buildNode(id: 'pm_b3_n1', title: 'Percabangan IF', offsetX: 0),
        _buildNode(id: 'pm_b3_n2', title: 'Percabangan IF-ELSE', offsetX: -60),
        _buildNode(id: 'pm_b3_n3', title: 'IF-ELSE IF', offsetX: 60),
        _buildNode(id: 'pm_b3_n4', title: 'Perulangan FOR dan WHILE', offsetX: -60),
        _buildNode(id: 'pm_b3_n5', title: 'BREAK dan CONTINUE', offsetX: 0),

        const SizedBox(height: 20),

        // BAB 4: FUNGSI DAN STRUKTUR DATA
        _buildChapterHeader('BAB 4: FUNGSI DAN STRUKTUR DATA'),
        const SizedBox(height: 30),

        _buildNode(id: 'pm_b4_n1', title: 'Mengenal Fungsi', offsetX: 0),
        _buildNode(id: 'pm_b4_n2', title: 'Parameter dan Argumen', offsetX: -60),
        _buildNode(id: 'pm_b4_n3', title: 'Nilai Kembalian', offsetX: 60),
        _buildNode(id: 'pm_b4_n4', title: 'Array dan List', offsetX: -60),
        _buildNode(id: 'pm_b4_n5', title: 'Pengolahan String', offsetX: 0),

        const SizedBox(height: 20),

        // BAB 5: MEMBANGUN PROGRAM SEDERHANA
        _buildChapterHeader('BAB 5: MEMBANGUN PROGRAM SEDERHANA'),
        const SizedBox(height: 30),

        _buildNode(id: 'pm_b5_n1', title: 'Input dari Pengguna', offsetX: 0),
        _buildNode(id: 'pm_b5_n2', title: 'Menampilkan Output', offsetX: -60),
        _buildNode(id: 'pm_b5_n3', title: 'Mengolah Data Pengguna', offsetX: 60),
        _buildNode(id: 'pm_b5_n4', title: 'Program Kalkulator', offsetX: -60),
        _buildNode(id: 'pm_b5_n5', title: 'Proyek Program Sederhana', offsetX: 0),
      ];
    }

    // ROADMAP PPLG
    if (widget.categoryId == 'pplg') {
      return [
        // BAB 1: DASAR PENGEMBANGAN PERANGKAT LUNAK DAN GIM
        _buildChapterHeader(
          'BAB 1: DASAR PENGEMBANGAN PERANGKAT LUNAK DAN GIM',
        ),
        const SizedBox(height: 30),

        _buildNode(id: 'pplg_b1_n1', title: 'Pengantar PPLG', offsetX: 0),
        _buildNode(id: 'pplg_b1_n2', title: 'Jenis Perangkat Lunak', offsetX: -60),
        _buildNode(id: 'pplg_b1_n3', title: 'Jenis dan Platform Gim', offsetX: 60),
        _buildNode(id: 'pplg_b1_n4', title: 'Profesi Bidang PPLG', offsetX: -60),
        _buildNode(id: 'pplg_b1_n5', title: 'Ekosistem Industri Digital', offsetX: 0),

        const SizedBox(height: 20),

        // BAB 2: ANALISIS DAN PERANCANGAN SISTEM
        _buildChapterHeader('BAB 2: ANALISIS DAN PERANCANGAN SISTEM'),
        const SizedBox(height: 30),

        _buildNode(id: 'pplg_b2_n1', title: 'Analisis Kebutuhan', offsetX: 0),
        _buildNode(id: 'pplg_b2_n2', title: 'Identifikasi Masalah', offsetX: -60),
        _buildNode(id: 'pplg_b2_n3', title: 'Perancangan Sistem', offsetX: 60),
        _buildNode(id: 'pplg_b2_n4', title: 'Pemodelan Sistem', offsetX: -60),
        _buildNode(id: 'pplg_b2_n5', title: 'Desain UI/UX', offsetX: 0),

        const SizedBox(height: 20),

        // BAB 3: PROSES PENGEMBANGAN PERANGKAT LUNAK
        _buildChapterHeader('BAB 3: PROSES PENGEMBANGAN PERANGKAT LUNAK'),
        const SizedBox(height: 30),

        _buildNode(id: 'pplg_b3_n1', title: 'Tahapan Pengembangan', offsetX: 0),
        _buildNode(id: 'pplg_b3_n2', title: 'Model Waterfall', offsetX: -60),
        _buildNode(id: 'pplg_b3_n3', title: 'Metode Agile', offsetX: 60),
        _buildNode(id: 'pplg_b3_n4', title: 'Pengembangan Berbasis Tim', offsetX: -60),
        _buildNode(id: 'pplg_b3_n5', title: 'Integrasi Sistem', offsetX: 0),

        const SizedBox(height: 20),

        // BAB 4: PENGUJIAN DAN PENGELOLAAN KODE
        _buildChapterHeader('BAB 4: PENGUJIAN DAN PENGELOLAAN KODE'),
        const SizedBox(height: 30),

        _buildNode(id: 'pplg_b4_n1', title: 'Dasar Pengujian Perangkat Lunak', offsetX: 0),
        _buildNode(id: 'pplg_b4_n2', title: 'Identifikasi dan Debugging', offsetX: -60),
        _buildNode(id: 'pplg_b4_n3', title: 'Teknik Software Testing', offsetX: 60),
        _buildNode(id: 'pplg_b4_n4', title: 'Version Control dengan Git', offsetX: -60),
        _buildNode(id: 'pplg_b4_n5', title: 'Kolaborasi GitHub', offsetX: 0),

        const SizedBox(height: 20),

        // BAB 5: DEPLOYMENT DAN PEMELIHARAAN
        _buildChapterHeader('BAB 5: DEPLOYMENT DAN PEMELIHARAAN'),
        const SizedBox(height: 30),

        _buildNode(id: 'pplg_b5_n1', title: 'Build dan Deployment', offsetX: 0),
        _buildNode(id: 'pplg_b5_n2', title: 'Hosting dan Publikasi', offsetX: -60),
        _buildNode(id: 'pplg_b5_n3', title: 'Keamanan Aplikasi', offsetX: 60),
        _buildNode(id: 'pplg_b5_n4', title: 'Pemeliharaan Perangkat Lunak', offsetX: -60),
        _buildNode(id: 'pplg_b5_n5', title: 'Proyek Akhir PPLG', offsetX: 0),
      ];
    }
    
    // DEFAULT / KATEGORI LAIN
    return [
      _buildChapterHeader('Materi Belajar ${widget.title}'),
      const SizedBox(height: 30),
      _buildNode(
        id: '${widget.categoryId}_n1',
        title: 'Tahap 1',
        offsetX: 0,
      ),
      _buildNode(
        id: '${widget.categoryId}_n2',
        title: 'Tahap 2',
        offsetX: -60,
      ),
    ];
  }
  Widget _buildChapterHeader(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0A0A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.neonGreen.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNode({
    required String id,
    required String title,
    double offsetX = 0,
  }) {
    final state = _nodeState(id);
    final stars = _starsMap[id] ?? 0;

    return Transform.translate(
      offset: Offset(offsetX, 0),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Column(
          children: [
            // Node circle
            GestureDetector(
              onTap: () => _onNodeTap(id, title.replaceAll('\n', ' '), state),
              child: Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _getNodeBackgroundColor(state),
                  border: Border.all(
                    color: _getNodeBorderColor(state),
                    width: 2.5,
                  ),
                  boxShadow: state == NodeState.completed ||
                          state == NodeState.current
                      ? [
                          BoxShadow(
                            color: AppColors.neonGreen.withValues(alpha: 0.2),
                            blurRadius: 20,
                            spreadRadius: 2,
                          )
                        ]
                      : null,
                ),
                child: Icon(
                  _getNodeIcon(state),
                  color: _getNodeIconColor(state),
                  size: 34,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Title
            Text(
              title,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: state == NodeState.locked ? Colors.white38 : Colors.white,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            // Bintang (hanya jika completed)
            if (state == NodeState.completed)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Icon(
                      Icons.star_rounded,
                      size: 16,
                      color: index < stars ? Colors.amber : Colors.white24,
                    ),
                  );
                }),
              ),
          ],
        ),
      ),
    );
  }

  Color _getNodeBackgroundColor(NodeState state) {
    switch (state) {
      case NodeState.completed:
        return AppColors.neonGreen;
      case NodeState.current:
        return const Color(0xFF08140B);
      case NodeState.locked:
        return const Color(0xFF141416);
    }
  }

  Color _getNodeBorderColor(NodeState state) {
    switch (state) {
      case NodeState.completed:
        return AppColors.neonGreen;
      case NodeState.current:
        return AppColors.neonGreen;
      case NodeState.locked:
        return Colors.white12;
    }
  }

  IconData _getNodeIcon(NodeState state) {
    switch (state) {
      case NodeState.completed:
        return Icons.check_rounded;
      case NodeState.current:
        return Icons.play_arrow_rounded;
      case NodeState.locked:
        return Icons.lock_rounded;
    }
  }

  Color _getNodeIconColor(NodeState state) {
    switch (state) {
      case NodeState.completed:
        return Colors.black;
      case NodeState.current:
        return AppColors.neonGreen;
      case NodeState.locked:
        return Colors.white38;
    }
  }
}
