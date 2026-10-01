import 'package:flutter/material.dart';
import '../../../shared/app_theme.dart';

class HomeHeader extends StatelessWidget {
  final int level;
  final int xp;
  final int fireCount;
  final int diamondCount;
  final int heartCount;
  final int maxHeart;

  const HomeHeader({
    super.key,
    this.level = 4,
    this.xp = 1450,
    this.fireCount = 5,
    this.diamondCount = 180,
    this.heartCount = 5,
    this.maxHeart = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        children: [
          // Level Badge
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: AppColors.neonGreen,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                'L$level',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // XP Text
          Text(
            '$xp XP',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          // Stats Row (kanan)
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Stat 1: Api (Fire)
                    _buildStatItem(
                      icon: Icons.local_fire_department_rounded,
                      iconColor: AppColors.fireOrange,
                      value: '$fireCount',
                    ),
                    const SizedBox(width: 10),
                    // Stat 2: Diamond
                    _buildStatItem(
                      icon: Icons.diamond_rounded,
                      iconColor: AppColors.diamondBlue,
                      value: '$diamondCount',
                    ),
                    const SizedBox(width: 10),
                    // Stat 3: Hati (Heart)
                    _buildStatItem(
                      icon: Icons.favorite_rounded,
                      iconColor: AppColors.heartRed,
                      value: '$heartCount/$maxHeart',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required Color iconColor,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: 16),
          const SizedBox(width: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
