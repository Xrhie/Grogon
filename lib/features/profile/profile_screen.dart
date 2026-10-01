import 'package:flutter/material.dart';
import '../../../shared/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              const Text(
                'PROFIL',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),

              // 1. MAIN PROFILE CARD
              _buildMainProfileCard(),
              const SizedBox(height: 16),

              // 2. CURRENCY ROW (Diamond & Heart)
              Row(
                children: [
                  Expanded(child: _buildDiamondCard()),
                  const SizedBox(width: 16),
                  Expanded(child: _buildHeartCard()),
                ],
              ),
              const SizedBox(height: 16),

              // 3. STATS CARD
              _buildStatsCard(),
              const SizedBox(height: 16),

              // 4. KEDAI CARD
              _buildStoreCard(),
              const SizedBox(height: 24),

              // 5. ACHIEVEMENTS & BADGES
              const Text(
                'PENCAPAIAN & BADGE',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: AppColors.neonGreen,
                ),
              ),
              const SizedBox(height: 12),

              // Hanya SATU badge sesuai instruksi
              _buildAchievementCard(),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainProfileCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0C140F), // Sangat gelap hijau kehitaman
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.neonGreen.withValues(alpha: 0.15),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Avatar
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.background,
                  border: Border.all(
                    color: AppColors.neonGreen,
                    width: 2,
                  ),
                ),
                child: ClipOval(
                child: Image.asset(
                  'assets/images/profil.jpg',
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                ),
                ),
              ),
              const SizedBox(width: 16),
              // Info Text
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ari Fardila',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    
                    SizedBox(height: 4),
                    Text(
                      'Level 4 • IT Apprentice',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Progress Bar Area
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Progres Level 5',
                style: TextStyle(fontSize: 11, color: Colors.white54),
              ),
              Text(
                '450 / 500 XP',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.neonGreen.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Bar track
          Container(
            height: 6,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(3),
            ),
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: 450 / 500, // 90%
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.neonGreen,
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.neonGreen.withValues(alpha: 0.5),
                      blurRadius: 4,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiamondCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF101518), // Dark kebiruan
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.diamondBlue.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.diamond_rounded, color: AppColors.diamondBlue, size: 24),
              const SizedBox(width: 8),
              const Text(
                '180',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.diamondBlue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Text(
            'Diamond',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeartCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF171112), // Dark kemerahan
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.heartRed.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.favorite_rounded, color: AppColors.heartRed, size: 24),
              const SizedBox(width: 8),
              const Text(
                '5/5',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.heartRed,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Text(
            'Hati Penuh',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF0F1210), // Sangat gelap
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.05),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Stat 1: Total XP
          _buildStatColumn(
            icon: Icons.star_rounded,
            iconColor: AppColors.neonGreen,
            value: '1450',
            label: 'Total XP',
          ),
          // Vertical Divider
          Container(
            width: 1,
            height: 40,
            color: Colors.white12,
          ),
          // Stat 2: Streak
          _buildStatColumn(
            icon: Icons.local_fire_department_rounded,
            iconColor: AppColors.fireOrange,
            value: '5 Hari',
            label: 'Streak',
          ),
          // Vertical Divider
          Container(
            width: 1,
            height: 40,
            color: Colors.white12,
          ),
          // Stat 3: Soal Selesai
          _buildStatColumn(
            icon: Icons.check_circle_rounded,
            iconColor: AppColors.diamondBlue,
            value: '42',
            label: 'Soal Selesai',
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn({
    required IconData icon,
    required Color iconColor,
    required String value,
    required String label,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: iconColor, size: 22),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.white54,
          ),
        ),
      ],
    );
  }

  Widget _buildStoreCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.diamondBlue.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title row
          Row(
            children: [
              const Icon(Icons.shopping_bag_rounded, color: AppColors.diamondBlue, size: 18),
              const SizedBox(width: 8),
              Text(
                'KEDAI CYBER & DIAMOND',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  color: AppColors.diamondBlue.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Inner Item Card
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF161B17),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.favorite_rounded, color: AppColors.heartRed, size: 28),
                const SizedBox(width: 12),
                // Text info
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Isi Ulang 5 Hati Penuh',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Kembalikan nyawa untuk terus berlatih',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                ),
                // Price Button
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.neonGreen,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '25 ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Icon(Icons.diamond_rounded, color: AppColors.diamondBlue, size: 14),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0C140F),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.neonGreen.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Badge Icon
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.neonGreen.withValues(alpha: 0.1),
              border: Border.all(
                color: AppColors.neonGreen.withValues(alpha: 0.5),
                width: 1.5,
              ),
            ),
            child: const Icon(
              Icons.emoji_events_rounded,
              color: AppColors.neonGreen,
              size: 24,
            ),
          ),
          const SizedBox(width: 14),
          // Badge Info
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Langkah Pertama',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Menyelesaikan 1 modul tahapan soal pertama',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
          ),
          // Reward text
          Row(
            children: [
              const Text(
                '+20 ',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColors.diamondBlue,
                ),
              ),
              const Icon(Icons.diamond_rounded, color: AppColors.diamondBlue, size: 14),
            ],
          ),
        ],
      ),
    );
  }
}
