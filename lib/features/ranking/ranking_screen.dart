import 'package:flutter/material.dart';
import '../../../shared/app_theme.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

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
              // HEADER LIGA
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.emoji_events, color: AppColors.neonGreen, size: 32),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'LIGA CYBER MASTER',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.2,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Musim 1 • Berakhir dalam 2 hari 14 jam',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.neonGreen,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // PODIUM
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Rank 2 (Siti)
                  _buildPodiumItem(
                    name: 'Siti',
                    initial: 'S',
                    xp: '2620 XP',
                    rank: 2,
                    color: Colors.grey[400]!, // Silver
                    height: 110,
                  ),
                  // Rank 1 (Budi)
                  _buildPodiumItem(
                    name: 'Budi',
                    initial: 'B',
                    xp: '2840 XP',
                    rank: 1,
                    color: Colors.amber, // Gold
                    height: 140,
                  ),
                  // Rank 3 (Kevin)
                  _buildPodiumItem(
                    name: 'Kevin',
                    initial: 'K',
                    xp: '2410 XP',
                    rank: 3,
                    color: Colors.orange[700]!, // Bronze
                    height: 90,
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // LIST TITLE
              const Text(
                'PERINGKAT MINGGUAN',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white54,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),

              // LIST ITEMS (Top 5)
              _buildRankingListItem(
                rank: 1,
                initial: 'B',
                name: 'Budi Santoso',
                fire: 14,
                xp: '2840 XP',
              ),
              _buildRankingListItem(
                rank: 2,
                initial: 'S',
                name: 'Siti Rahmawati',
                
                fire: 11,
                xp: '2620 XP',
              ),
              _buildRankingListItem(
                rank: 3,
                initial: 'K',
                name: 'Kevin Pratama',
                
                fire: 9,
                xp: '2410 XP',
              ),
              _buildRankingListItem(
                rank: 4,
                initial: 'A',
                name: 'Ari Fardila',
                
                fire: 5,
                xp: '450 XP',
                isCurrentUser: true,
              ),
              _buildRankingListItem(
                rank: 5,
                initial: 'N',
                name: 'Nadia Salsabila',
                
                fire: 4,
                xp: '390 XP',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPodiumItem({
    required String name,
    required String initial,
    required String xp,
    required int rank,
    required Color color,
    required double height,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Avatar
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.background,
            border: Border.all(color: color, width: 2),
          ),
          alignment: Alignment.center,
          child: Text(
            initial,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          xp,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: AppColors.neonGreen,
          ),
        ),
        const SizedBox(height: 12),
        // Podium Block
        Container(
          width: 85,
          height: height,
          decoration: BoxDecoration(
            color: const Color(0xFF0D150F), // Sangat gelap, hijau kehitaman
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            border: Border.all(
              color: AppColors.neonGreen.withValues(alpha: 0.15),
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            '#$rank',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRankingListItem({
    required int rank,
    required String initial,
    required String name,
    required int fire,
    required String xp,
    bool isCurrentUser = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: isCurrentUser ? const Color(0xFF132F15) : const Color(0xFF141416),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isCurrentUser ? AppColors.neonGreen : Colors.white.withValues(alpha: 0.05),
          width: 1,
        ),
        boxShadow: isCurrentUser
            ? [
                BoxShadow(
                  color: AppColors.neonGreen.withValues(alpha: 0.1),
                  blurRadius: 8,
                )
              ]
            : null,
      ),
      child: Row(
        children: [
          // Rank Number
          SizedBox(
            width: 30,
            child: Text(
              '#$rank',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: isCurrentUser ? AppColors.neonGreen : Colors.white54,
              ),
            ),
          ),
          // Avatar
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.background,
              border: Border.all(
                color: isCurrentUser ? AppColors.neonGreen : Colors.white24,
                width: 1,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              initial,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isCurrentUser ? AppColors.neonGreen : Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 14),
          // Name and Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: isCurrentUser ? Colors.white : Colors.white.withValues(alpha: 0.9),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
          // Stats
          Row(
            children: [
              const SizedBox(width: 16),
              Text(
                xp,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.neonGreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
