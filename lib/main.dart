import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'firebase_options.dart';
import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Supabase.initialize(
    url: 'https://koofjfajrairlgvpocyd.supabase.co',
    publishableKey: 'sb_publishable_wHRnjoHFETGn7Zki1vIbGw_9UG3zUU5',
  );
  try {
  await Supabase.instance.client
        .from('questions')
        .select('id')
        .limit(1);

    debugPrint('SUPABASE: Berhasil membaca tabel questions');
  } catch (e) {
    debugPrint('SUPABASE ERROR: $e');
  }

  runApp(const GrogonApp());
}