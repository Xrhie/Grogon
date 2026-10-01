import 'package:flutter/material.dart';
import '../../../shared/app_theme.dart';
import '../../ranking/ranking_screen.dart';
import '../../profile/profile_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    RankingScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.background,
          border: Border(
            top: BorderSide(
              color: Colors.white10,
              width: 0.5,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: AppColors.background,
          selectedItemColor: AppColors.neonGreen,
          unselectedItemColor: Colors.white54,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
          ),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.school_outlined),
              activeIcon: const Icon(
                Icons.school_rounded,
                color: AppColors.neonGreen,
              ),
              label: 'Menu',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded),
              activeIcon: Icon(Icons.bar_chart_rounded, color: AppColors.neonGreen),
              label: 'Peringkat',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              activeIcon: Icon(Icons.person_rounded, color: AppColors.neonGreen),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
