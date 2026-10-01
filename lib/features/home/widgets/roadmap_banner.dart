import 'package:flutter/material.dart';
import '../../../shared/app_theme.dart';

/// Banner "Selamat Datang" di halaman Home yang menampilkan
/// roadmap belajar dan sambutan kepada pengguna.
class RoadmapBanner extends StatelessWidget {
  final String userName;

  const RoadmapBanner({
    super.key,
    this.userName = 'Pelajar',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 120),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1F12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          // Content aligned to bottom
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 5), // Push content down
              // Label
              Text(
                'ROADMAP BELAJAR IT',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.neonGreen,
                  letterSpacing: 0.5,
                ),
                  ),
              const SizedBox(height: 4),
              // Judul sambutan
              Text(
                'Selamat Datang, $userName!',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  height: 1.1,
                ),
                  ),
              const SizedBox(height: 4),
              // Deskripsi
              const Text(
                'Selesaikan tahapan untuk membuka\nmodul tingkat berikutnya.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                  height: 1.4,
                ),
            ),
            ],
          ),
          // Avatar/ikon di pojok kanan (tengah secara vertikal atau sesuai gambar)
          Positioned(
            right: 7,
            top: 20,
            bottom: 20,
            child: Center(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.neonGreen.withValues(alpha: 0.1),
                  border: Border.all(
                    color: AppColors.neonGreen.withValues(alpha: 0.5),
                    width: 1.5,
                  ),
                ),
                child: ClipOval(
                child: Image.asset(
                  'assets/images/profil.jpg',
                  width: 70,
                  height: 70,
                  fit: BoxFit.contain,
                ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
