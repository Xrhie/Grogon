import 'package:flutter/material.dart';
import '../../../shared/app_theme.dart';

class LearningAreaCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final int totalBab;
  final int completedBab;
  final VoidCallback? onTap;

  const LearningAreaCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.totalBab = 5,
    this.completedBab = 0,
    this.onTap,
  });

  double get _progress =>
      totalBab > 0 ? (completedBab / totalBab).clamp(0.0, 1.0) : 0.0;

  int get _progressPercent => (_progress * 100).round();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.08), width: 1),
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
          fit: StackFit.expand,
          children: [
            // Background Image
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            // Gradient Overlay for readability
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.35),
                    Colors.black.withValues(alpha: 0.88),
                  ],
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Text
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // Subtitle
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.white54,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  // Bab info row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 6),
                          Transform.translate(
                            offset: const Offset(-6, 0),
                            child: Text(
                              '$completedBab/$totalBab Bab',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppColors.neonGreen,
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                        ],
                      ),
                      Text(
                        '$_progressPercent%',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  // Progress Line Indicator
                  Container(
                    height: 3.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.white12,
                    ),
                    alignment: Alignment.centerLeft,
                    child: FractionallySizedBox(
                      widthFactor: _progress,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColors.neonGreen,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.neonGreen.withValues(alpha: 0.6),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
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
