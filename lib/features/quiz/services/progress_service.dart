import 'package:shared_preferences/shared_preferences.dart';

/// Menyimpan dan membaca progres kuis per node secara persisten.
///
/// Kunci penyimpanan: "stars_{categoryId}_{nodeId}" → nilai int (0–3).
/// Tidak menyimpan jawaban atau data soal apapun.
class ProgressService {
  // ─── Kunci penyimpanan ────────────────────────────────────────────────────
  static String _key(String categoryId, String nodeId) =>
      'stars_${categoryId}_$nodeId';

  // ─── Tulis bintang ────────────────────────────────────────────────────────
  /// Simpan jumlah bintang untuk sebuah node.
  /// Hanya menyimpan jika nilai baru lebih tinggi dari yang tersimpan
  /// (tidak menurunkan bintang).
  static Future<void> saveStars(
      String categoryId, String nodeId, int stars) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _key(categoryId, nodeId);
    final current = prefs.getInt(key) ?? 0;
    if (stars > current) {
      await prefs.setInt(key, stars);
    }
  }

  // ─── Baca bintang satu node ───────────────────────────────────────────────
  static Future<int> getStars(String categoryId, String nodeId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_key(categoryId, nodeId)) ?? 0;
  }

  // ─── Baca bintang banyak node sekaligus ──────────────────────────────────
  /// Mengembalikan `Map<nodeId, stars>` untuk daftar nodeId yang diberikan.
  static Future<Map<String, int>> getStarsForNodes(
      String categoryId, List<String> nodeIds) async {
    final prefs = await SharedPreferences.getInstance();
    return {
      for (final id in nodeIds)
        id: prefs.getInt(_key(categoryId, id)) ?? 0,
    };
  }

  // ─── Hapus semua progres (untuk keperluan reset / testing) ───────────────
  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    final keys =
        prefs.getKeys().where((k) => k.startsWith('stars_')).toList();
    for (final k in keys) {
      await prefs.remove(k);
    }
  }
}
