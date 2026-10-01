import 'package:flutter/material.dart';
import '../features/home/screens/main_screen.dart';
import '../shared/app_theme.dart';

/// Root widget aplikasi Grogon.
class GrogonApp extends StatelessWidget {
  const GrogonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grogon',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const MainScreen(),
    );
  }
}
