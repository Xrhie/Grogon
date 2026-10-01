import 'package:flutter/material.dart';
import '../../../shared/app_theme.dart';

class TournamentBanner extends StatelessWidget {
  final VoidCallback? onTap;

  const TournamentBanner({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.1),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // Background Image
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                'assets/images/turnamen.png',
                fit: BoxFit.cover,
              ),
            ),
            // Gradient Overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.2),
                      Colors.black.withValues(alpha: 0.9),
                    ],
                  ),
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Label & Status
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.emoji_events_rounded,
                              color: AppColors.neonGreen,
                              size: 14,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'TURNAMEN IT NASIONAL',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: AppColors.neonGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Title
                  const Text(
                    'Arena Kompetisi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Subtitle
                  const Text(
                    'Buat room turnamen atau bergabung denga kode untuk bertanding kuis cepat IT.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Prize Info
                  Row(
                    children: const [
                      Icon(
                        Icons.emoji_events_outlined,
                        color: Colors.orangeAccent,
                        size: 16,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Hadiah: +150 XP & 25 Diamond',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.diamond_rounded,
                        color: AppColors.diamondBlue,
                        size: 14,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Button
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.neonGreen,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Masuk Arena',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

