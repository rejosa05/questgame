import 'package:flutter/material.dart';
import '../widgets/common_widgets.dart';
import 'era_list_screen.dart';
import 'practice_game_screen.dart';
import 'competition_placeholder.dart';
import 'knowledge_card_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lakbay Talino')),
      body: ListView(
        children: [
          InfoCard(
            title: 'Panimula ng Aplikasyon',
            subtitle: 'Kilalanin ang iyong misyon at simulan ang paglalakbay.',
            icon: Icons.info_outline,
            onTap: () => _showIntroDialog(context),
          ),
          InfoCard(
            title: 'Lakbay Talino',
            subtitle: 'Pumili ng yugto ng kasaysayan',
            icon: Icons.map,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const EraListScreen()), // 👈 FIXED
            ),
          ),
          InfoCard(
            title: 'Laro ng Pagsasanay',
            subtitle: 'Subukin ang iyong galing at kumita ng puntos',
            icon: Icons.videogame_asset,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PracticeGameScreen()),
            ),
          ),
          InfoCard(
            title: 'Paligsahan ng Kaalaman',
            subtitle: 'Makipagsabayan sa iba!',
            icon: Icons.emoji_events,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CompetitionPlaceholder()),
            ),
          ),
          InfoCard(
            title: 'Karunungan Card - Review',
            subtitle: 'Balikan ang mga aralin at patibayin ang iyong kaalaman.',
            icon: Icons.book,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const KnowledgeCardScreen()),
            ),
          ),
        ],
      ),
    );
  }

  void _showIntroDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Panimula'),
        content: const Text(
          'Maligayang pagdating sa Lakbay Talino! Piliin ang yugto at simulan ang hamon.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Sige'),
          ),
        ],
      ),
    );
  }
}
