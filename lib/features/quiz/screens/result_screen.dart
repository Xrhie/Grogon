import 'package:flutter/material.dart';
import '../../../shared/app_theme.dart';
import '../services/progress_service.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  final int totalQuestions;
  final String categoryId;
  final String nodeId;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.categoryId,
    required this.nodeId,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool _saving = true;

  /// Hitung bintang berdasarkan jumlah jawaban benar dari 10 soal.
  /// 0–4 benar → 0 ⭐ | 5–6 benar → 1 ⭐ | 7–9 benar → 2 ⭐ | 10 benar → 3 ⭐
  int get _stars {
    final s = widget.score;
    if (s >= widget.totalQuestions) return 3;   // sempurna
    if (s >= 7) return 2;
    if (s >= 5) return 1;
    return 0;
  }

  @override
  void initState() {
    super.initState();
    _saveProgress();
  }

  Future<void> _saveProgress() async {
    await ProgressService.saveStars(widget.categoryId, widget.nodeId, _stars);
    if (mounted) setState(() => _saving = false);
  }

  @override
  Widget build(BuildContext context) {
    final double percentage =
        widget.totalQuestions > 0 ? (widget.score / widget.totalQuestions) * 100 : 0;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Ikon trofi
              const Icon(
                Icons.emoji_events_rounded,
                color: Colors.amber,
                size: 100,
              ),
              const SizedBox(height: 24),

              const Text(
                'Kuis Selesai!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // Skor
              Text(
                'Skor Anda: ${widget.score} / ${widget.totalQuestions}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: AppColors.neonGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${percentage.toInt()}% Benar',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.white54),
              ),
              const SizedBox(height: 24),

              // Bintang
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Icon(
                      Icons.star_rounded,
                      size: 48,
                      color: i < _stars ? Colors.amber : Colors.white24,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 12),

              // Label bintang
              Text(
                _starLabel(_stars),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white54,
                ),
              ),

              // Pesan buka node (jika 3 bintang)
              if (_stars == 3) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.neonGreen.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.neonGreen.withValues(alpha: 0.3)),
                  ),
                  child: const Text(
                    '🔓 Node berikutnya telah terbuka!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.neonGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 40),

              // Tombol kembali
              ElevatedButton(
                onPressed: _saving
                    ? null
                    : () {
                        // Pop ResultScreen, QuizScreen, dan QuizPreStartSheet sekaligus
                        // agar kembali langsung ke RoadmapScreen yang akan refresh progres.
                        Navigator.of(context).popUntil(
                          (route) => route.settings.name == '/roadmap' || route.isFirst,
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.neonGreen,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _saving
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                        ),
                      )
                    : const Text(
                        'Kembali ke Roadmap',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _starLabel(int stars) {
    switch (stars) {
      case 3: return 'Sempurna! Semua jawaban benar.';
      case 2: return 'Bagus! 7–9 jawaban benar.';
      case 1: return 'Cukup. 5–6 jawaban benar.';
      default: return 'Belum lulus. Jawaban benar kurang dari 5.';
    }
  }
}
