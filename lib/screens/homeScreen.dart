import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/audio_manager.dart';
import '../widgets/common_widgets.dart';
import 'era_list_screen.dart';
import 'practice_game_screen.dart';
import 'competition_placeholder.dart';
import 'knowledge_card_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // 🎵 Restart the background music when home opens
    AudioManager.playBackgroundMusic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Lakbay Talino (Juan Quest)')),
      body: Container(
        padding: const EdgeInsets.only(top: 50.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg-main.png"), // <-- make sure sakto ang path
            fit: BoxFit.cover, // para sakto ang scaling sa image
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Image.asset(
                'assets/images/homeScreen.png',
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            InfoCard(
              title: 'PANIMULA NG APLIKASYON',
              subtitle: 'Kilalanin ang iyong misyon at simulan ang paglalakbay.',
              leadingIcon: Icon(
                FontAwesomeIcons.bookOpen,
                size: 35,
                color: Colors.yellow.shade900,
              ),
              backgroundColor: Colors.orangeAccent.shade100,
              textColor: Colors.black87,
              borderColor: Colors.orangeAccent.shade700,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PracticeGameScreen()),
              ),
            ),
            InfoCard(
              title: 'LAKBAY TALINO',
              subtitle: 'Pumili ng yugto ng kasaysayan',
              leadingIcon: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 35,
                color: Colors.green.shade900,
              ),
              backgroundColor: Colors.lightGreen.shade400,
              textColor: Colors.black87,
              borderColor: Colors.lightGreen.shade900,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PracticeGameScreen()),
              ),
            ),
            InfoCard(
              title: 'LARO NG PAGSASANAY',
              subtitle: 'Subukin ang iyong galing at kumita ng puntos',
              leadingIcon: Icon(
                FontAwesomeIcons.brain,
                size: 35,
                color: Colors.deepOrange,
              ),
              backgroundColor: Colors.orange.shade100,
              textColor: Colors.black87,
              borderColor: Colors.deepOrange.shade300,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PracticeGameScreen()),
              ),
            ),
            InfoCard(
              title: 'PALIGSAHAN NG KAALAMAN',
              subtitle: 'Makipagsabayan sa iba!',
              leadingIcon: Icon(
                FontAwesomeIcons.trophy,
                size: 35,
                color: Colors.blueAccent,
              ),
              backgroundColor: Colors.blue.shade100,
              textColor: Colors.black87,
              borderColor: Colors.blue.shade300,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PracticeGameScreen()),
              ),
            ),
            InfoCard(
              title: 'KARUNUNGAN CARD',
              subtitle: 'Balikan ang mga aralin at patibayin ang iyong kaalaman.',
              leadingIcon: Icon(
                FontAwesomeIcons.bookOpenReader,
                size: 35,
                color: Colors.grey.shade700,
              ),
              backgroundColor: Colors.grey.shade300,
              textColor: Colors.black87,
              borderColor: Colors.grey.shade800,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PracticeGameScreen()),
              ),
            ),
          ],
        ),
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
