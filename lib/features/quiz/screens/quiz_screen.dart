import 'package:flutter/material.dart';
import '../../../shared/app_theme.dart';
import '../models/question_model.dart';
import '../services/quiz_service.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String title;
  final String categoryId;
  final String nodeId;
  final List<QuestionModel> questions;

  const QuizScreen({
    super.key,
    required this.title,
    required this.categoryId,
    required this.nodeId,
    required this.questions,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  int _score = 0;
  bool _answered = false;
  int? _selectedOptionIndex;
  int _hearts = 5;

  bool _isLoadingCheck = false;
  bool _isAnswerCorrect = false;
  String _explanation = '';

  late AnimationController _feedbackAnimController;
  late Animation<Offset> _feedbackSlideAnimation;

  @override
  void initState() {
    super.initState();
    _feedbackAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _feedbackSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _feedbackAnimController,
      curve: Curves.easeOutCubic,
    ));
  }

  @override
  void dispose() {
    _feedbackAnimController.dispose();
    super.dispose();
  }

  void _selectAndSubmit(int index) async {
    if (_answered || _isLoadingCheck) return;

    setState(() {
      _selectedOptionIndex = index;
      _isLoadingCheck = true;
    });

    // Jika soal berasal dari lokal (punya correctAnswerIndex)
    if (widget.questions[_currentIndex].correctAnswerIndex != null) {
      final isCorrect = index == widget.questions[_currentIndex].correctAnswerIndex;
      setState(() {
        _isLoadingCheck = false;
        _answered = true;
        _isAnswerCorrect = isCorrect;
        _explanation = widget.questions[_currentIndex].explanation ?? '';
        if (isCorrect) {
          _score++;
        } else {
          _hearts--;
        }
      });
      _feedbackAnimController.forward();
      return;
    }

    try {
      final quizService = QuizService();
      final result = await quizService.checkAnswer(
          widget.questions[_currentIndex].id, index);

      if (!mounted) return;

      setState(() {
        _isLoadingCheck = false;
        _answered = true;
        _isAnswerCorrect = result['is_correct'] as bool;
        _explanation = result['explanation'] as String;

        if (_isAnswerCorrect) {
          _score++;
        } else {
          _hearts--;
        }
      });

      _feedbackAnimController.forward();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoadingCheck = false;
        _selectedOptionIndex = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  void _nextQuestion() {
    _feedbackAnimController.reverse().then((_) {
      if (_currentIndex < widget.questions.length - 1 && _hearts > 0) {
        setState(() {
          _currentIndex++;
          _answered = false;
          _selectedOptionIndex = null;
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              score: _score,
              totalQuestions: widget.questions.length,
              categoryId: widget.categoryId,
              nodeId: widget.nodeId,
            ),
          ),
        );
      }
    });
  }

  bool get _isCorrect => _isAnswerCorrect;

  @override
  Widget build(BuildContext context) {
    if (widget.questions.isEmpty) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Belum ada soal untuk modul ini.'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali'),
              ),
            ],
          ),
        ),
      );
    }

    final currentQuestion = widget.questions[_currentIndex];
    final progress = (_currentIndex + 1) / widget.questions.length;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            // Main quiz content
            Column(
              children: [
                // Custom Header
                _buildHeader(progress),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 140),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Question Layout
                        _buildQuestionCard(currentQuestion),
                        const SizedBox(height: 24),

                        // Options
                        ...List.generate(
                          currentQuestion.options.length,
                          (index) =>
                              _buildOptionTile(currentQuestion, index),
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottom Button (only when NOT answered)
                if (!_answered)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _selectedOptionIndex != null
                            ? () => _selectAndSubmit(_selectedOptionIndex!)
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.neonGreen,
                          disabledBackgroundColor:
                              Colors.white.withValues(alpha: 0.05),
                          foregroundColor: Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: _isLoadingCheck
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                                ),
                              )
                            : Text(
                                'PERIKSA JAWABAN',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: _selectedOptionIndex == null
                                      ? Colors.white24
                                      : Colors.black,
                                ),
                              ),
                      ),
                    ),
                  ),
              ],
            ),

            // Feedback panel (slides up when answered)
            if (_answered)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SlideTransition(
                  position: _feedbackSlideAnimation,
                  child: _buildFeedbackPanel(currentQuestion),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(double progress) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.close, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Soal ${_currentIndex + 1} dari ${widget.questions.length}',
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: const TextStyle(
                        color: AppColors.neonGreen,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.white12,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.neonGreen),
                    minHeight: 8,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white12),
            ),
            child: Row(
              children: [
                const Icon(Icons.favorite_rounded,
                    color: AppColors.heartRed, size: 18),
                const SizedBox(width: 6),
                Text(
                  '$_hearts',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(QuestionModel question) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.asset(
          'assets/images/Ikon_Soal.png',
          width: 150,
          height: 150,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'PERTANYAAN',
                  style: TextStyle(
                    color: AppColors.neonGreen,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  question.questionText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionTile(QuestionModel question, int index) {
    final optionLabel = String.fromCharCode(65 + index); // A, B, C, D
    final isSelected = _selectedOptionIndex == index;

    Color borderColor = Colors.white.withValues(alpha: 0.1);
    Color bgColor = Colors.transparent;
    Color textColor = Colors.white70;
    Color labelBgColor = Colors.white.withValues(alpha: 0.05);
    FontWeight fontWeight = FontWeight.normal;

    if (_answered) {
      bool isCorrectOption = false;
      if (question.correctAnswerIndex != null) {
        isCorrectOption = index == question.correctAnswerIndex;
      } else {
        isCorrectOption = _isAnswerCorrect && index == _selectedOptionIndex;
      }

      if (isCorrectOption) {
        borderColor = AppColors.neonGreen;
        bgColor = AppColors.neonGreen.withValues(alpha: 0.1);
        textColor = Colors.white;
        labelBgColor = AppColors.neonGreen.withValues(alpha: 0.2);
        fontWeight = FontWeight.w600;
      } else if (isSelected) {
        borderColor = AppColors.heartRed;
        bgColor = AppColors.heartRed.withValues(alpha: 0.1);
        textColor = Colors.white;
        labelBgColor = AppColors.heartRed.withValues(alpha: 0.2);
        fontWeight = FontWeight.w600;
      }
    } else if (isSelected) {
      borderColor = AppColors.neonGreen.withValues(alpha: 0.5);
      bgColor = AppColors.neonGreen.withValues(alpha: 0.05);
      textColor = Colors.white;
      fontWeight = FontWeight.w600;
    }

    return GestureDetector(
      onTap: () {
        if (!_answered) {
          setState(() => _selectedOptionIndex = index);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: labelBgColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  optionLabel,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                question.options[index],
                style: TextStyle(
                  color: textColor,
                  fontSize: 15,
                  fontWeight: fontWeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackPanel(QuestionModel question) {
    final correct = _isCorrect;
    final accentColor = correct ? AppColors.neonGreen : AppColors.heartRed;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(
          top: BorderSide(
            color: accentColor.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title row with icon
              Row(
                children: [
                  Icon(
                    correct
                        ? Icons.check_circle_rounded
                        : Icons.warning_rounded,
                    color: accentColor,
                    size: 24,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      correct
                          ? 'Luar Biasa, Jawaban Benar!'
                          : 'Jawaban Kurang Tepat (-1 Hati)',
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),

              // Explanation
              if (_explanation.isNotEmpty) ...[
                const SizedBox(height: 10),
                Text(
                  _explanation,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ],

              const SizedBox(height: 18),

              // Continue button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _nextQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    _currentIndex == widget.questions.length - 1
                        ? 'LIHAT HASIL'
                        : 'LANJUTKAN SOAL BERIKUTNYA',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
