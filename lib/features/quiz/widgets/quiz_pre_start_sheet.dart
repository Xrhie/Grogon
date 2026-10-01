import 'package:flutter/material.dart';
import '../../../shared/app_theme.dart';
import '../models/question_model.dart';
import '../screens/quiz_screen.dart';

class QuizPreStartSheet extends StatelessWidget {
  final String chapterTitle;
  final String quizTitle;
  final String description;
  final String categoryId;
  final String nodeId;
  final List<QuestionModel> questions;

  const QuizPreStartSheet({
    super.key,
    required this.chapterTitle,
    required this.quizTitle,
    required this.description,
    required this.categoryId,
    required this.nodeId,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF0A0B0C),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 32),
          // Chapter Label
          Text(
            chapterTitle.toUpperCase(),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: AppColors.neonGreen,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          // Quiz Title
          Text(
            quizTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          // Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white54,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          // Rewards Box
          Row(
            children: [
              Expanded(
                child: _buildRewardItem(
                  label: 'XP REWARD',
                  value: '+50 XP',
                  color: AppColors.neonGreen,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildRewardItem(
                  label: 'DIAMOND',
                  value: '+5',
                  color: AppColors.diamondBlue,
                  icon: Icons.diamond_rounded,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          // Start Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(
                      title: quizTitle,
                      categoryId: categoryId,
                      nodeId: nodeId,
                      questions: questions,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.neonGreen,
                foregroundColor: Colors.black,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.play_arrow_rounded, size: 24),
                  SizedBox(width: 8),
                  Text(
                    'MULAI LATIHAN',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildRewardItem({
    required String label,
    required String value,
    required Color color,
    IconData? icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.white38,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: color,
                ),
              ),
              if (icon != null) ...[
                const SizedBox(width: 4),
                Icon(icon, color: color, size: 18),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
