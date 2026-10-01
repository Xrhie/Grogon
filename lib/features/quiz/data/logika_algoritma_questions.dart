import '../models/question_model.dart';

/// Data soal untuk bidang Logika & Algoritma.
final Map<String, List<QuestionModel>> logikaAlgoritmaQuestions = {
  'la_b1_n1': [
    const QuestionModel(
      id: 'la1_1',
      questionText: 'Apa definisi dari algoritma?',
      options: [
        'Bahasa pemrograman',
        'Urutan langkah logis untuk menyelesaikan masalah',
        'Sistem operasi komputer',
        'Perangkat keras',
      ],
      correctAnswerIndex: 1,
      explanation: 'Algoritma adalah urutan langkah-langkah logis dan sistematis yang digunakan untuk menyelesaikan suatu masalah atau mencapai tujuan tertentu.',
    ),
  ],
};

