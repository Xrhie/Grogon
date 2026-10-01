import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/question_model.dart';

class QuizService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<QuestionModel>> getQuestionsByNode(String categoryId, String nodeId) async {
    try {
      final response = await _client
          .from('questions')
          .select('id, question_text, options')
          .eq('category_id', categoryId)
          .eq('node_id', nodeId);

      final data = response as List<dynamic>;
      return data.map((q) => QuestionModel.fromJson(q as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Gagal memuat soal dari server: $e');
    }
  }

  Future<Map<String, dynamic>> checkAnswer(String questionId, int selectedIndex) async {
    try {
      // Implementasi validasi jawaban yang aman menggunakan Supabase RPC atau Edge Function
      // CATATAN: Untuk saat ini kita memanggil RPC 'check_answer' (yang harus dibuat di database Supabase).
      // Mengambil correct_answer_index secara client-side DILARANG KARENA RLS (Security).
      final response = await _client.rpc('check_answer', params: {
        'p_question_id': questionId,
        'p_selected_index': selectedIndex,
      });

      return {
        'is_correct': response['is_correct'] as bool,
        'explanation': response['explanation'] as String,
      };
    } on PostgrestException catch (e) {
      if (e.message.contains('Could not find the function')) {
        throw Exception('Mekanisme server-side (RPC check_answer) belum tersedia di Supabase. RLS harus tetap dipertahankan dan jangan membocorkan kunci jawaban ke client.');
      }
      throw Exception('Terjadi kesalahan pada validasi jawaban: ${e.message}');
    } catch (e) {
      throw Exception('Gagal memvalidasi jawaban: $e');
    }
  }
}
