import 'package:flutter/material.dart';
import '../../../shared/app_theme.dart';
import '../widgets/home_header.dart';
import '../widgets/learning_area_card.dart';
import '../widgets/roadmap_banner.dart';
import '../widgets/tournament_banner.dart';
import '../../roadmap/roadmap_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            const HomeHeader(),
            const SizedBox(height: 8),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const RoadmapBanner(userName: 'Ari Fardila'),
                    const SizedBox(height: 16),

                    // 2x2 Grid of Learning Areas
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 0.90,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        LearningAreaCard(
                          title: 'Dasar Komputer',
                          subtitle: 'Hardware & Software',
                          imagePath: 'assets/images/dasar_komputer.png',
                          totalBab: 5,
                          completedBab: 1,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RoadmapScreen(
                                  title: 'Dasar Komputer',
                                  categoryId: 'dasar_komputer',
                                ),
                              ),
                            );
                          },
                        ),
                        LearningAreaCard(
                          title: 'Logika & Algoritma',
                          subtitle: 'Flowchart & Pseudocode',
                          imagePath: 'assets/images/logika_algoritma.png',
                          totalBab: 5,
                          completedBab: 0,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RoadmapScreen(
                                  title: 'Logika & Algoritma',
                                  categoryId: 'logika_algoritma',
                                ),
                              ),
                            );
                          },
                        ),
                        LearningAreaCard(
                          title: 'Pemrograman',
                          subtitle: 'Sintaks & Variabel',
                          imagePath: 'assets/images/pemrograman.png',
                          totalBab: 5,
                          completedBab: 0,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RoadmapScreen(
                                  title: 'Pemrograman',
                                  categoryId: 'pemrograman',
                                ),
                              ),
                            );
                          },
                        ),
                        LearningAreaCard(
                          title: 'PPLG',
                          subtitle: 'SDLC & Git',
                          imagePath: 'assets/images/perangkat_lunak.png',
                          totalBab: 5,
                          completedBab: 0,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RoadmapScreen(
                                  title: 'PPLG',
                                  categoryId: 'perangkat_lunak',
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    // Tournament Wide Banner
                    TournamentBanner(
                      onTap: () {
                        // Navigasi ke Tournament Flow (Fase 7)
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
