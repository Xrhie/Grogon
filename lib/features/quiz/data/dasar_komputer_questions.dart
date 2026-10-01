import '../models/question_model.dart';

/// Data soal untuk bidang Dasar Komputer.
/// Key (String) merepresentasikan ID Node (tahapan) pada Roadmap.
final Map<String, List<QuestionModel>> dasarKomputerQuestions = {
  // Bab 1 - Node 1: Generasi Pertama
  'dk_b1_n1': [
    const QuestionModel(
      id: 'dk1_1',
      questionText: 'Komponen elektronik utama yang digunakan pada komputer generasi pertama adalah...',
      options: [
        'Transistor',
        'Tabung Hampa (Vacuum Tube)',
        'Sirkuit Terpadu (IC)',
        'Mikroprosesor',
      ],
      correctAnswerIndex: 1,
      explanation: 'Komputer generasi pertama (1940-1956) mengandalkan tabung hampa sebagai komponen utamanya yang berukuran sangat besar dan cepat panas.',
    ),
    const QuestionModel(
      id: 'dk1_2',
      questionText: 'Salah satu contoh komputer generasi pertama yang paling terkenal adalah...',
      options: [
        'ENIAC',
        'IBM PC',
        'Macintosh',
        'Altair 8800',
      ],
      correctAnswerIndex: 0,
      explanation: 'ENIAC (Electronic Numerical Integrator and Computer) adalah salah satu komputer tujuan umum elektronik pertama di dunia.',
    ),
  ],
  // Bab 1 - Node 2: Revolusi Transistor & Sirkuit IC
  'dk_b1_n2': [
    const QuestionModel(
      id: 'dk2_1',
      questionText: 'Penemuan apa yang menggantikan tabung hampa dan menandai dimulainya komputer generasi kedua?',
      options: [
        'Resistor',
        'Kapasitor',
        'Transistor',
        'Dioda',
      ],
      correctAnswerIndex: 2,
      explanation: 'Transistor ditemukan pada tahun 1947 dan membuat komputer menjadi lebih kecil, lebih cepat, dan lebih murah dibanding generasi sebelumnya.',
    ),
  ],
};

