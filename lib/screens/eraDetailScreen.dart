import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/era.dart';
import '../utils/audio_manager.dart';
import 'quizScreen.dart';

class EraDetailScreen extends StatefulWidget {
  final Era era;
  const EraDetailScreen({super.key, required this.era});

  @override
  State<EraDetailScreen> createState() => _EraDetailScreenState();
}

class _EraDetailScreenState extends State<EraDetailScreen> {
  @override
  void initState() {
    super.initState();
    // 🎵 Restart background music when this screen loads
    AudioManager.playBackgroundMusic();
  }

  @override
  Widget build(BuildContext context) {
    final era = widget.era;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          era.title,
          style: const TextStyle(
            fontFamily: 'Merriweather',
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black.withOpacity(0.3),
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(era.backgroundImage, fit: BoxFit.cover),
          Container(color: Colors.black.withOpacity(0.55)),

          // Content
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 100, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Subtitle
                Text(
                  era.subtitle,
                  style: const TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                // const SizedBox(height: 24),

                // Header
                const Text(
                  'Mga Tanong (Preview):',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.amberAccent,
                  ),
                ),
                // const SizedBox(height: 12),

                // List of Questions
                Expanded(
                  child: ListView.separated(
                    itemCount: era.questions.length,
                    separatorBuilder: (_, __) =>
                    const Divider(color: Colors.white24),
                    itemBuilder: (context, index) {
                      final q = era.questions[index];

                      // Dynamic icon (optional - rotates through list)
                      final icons = [
                        FontAwesomeIcons.userShield,
                        FontAwesomeIcons.lightbulb,
                        FontAwesomeIcons.bookOpen,
                        FontAwesomeIcons.scroll,
                        FontAwesomeIcons.chessKnight,
                      ];
                      // final icon = icons[index % icons.length];
                      final icon = FontAwesomeIcons.lightbulb;

                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white24),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white.withOpacity(0.85),
                            child: FaIcon(
                              icon,
                              color: era.color,
                              size: 16,
                            ),
                          ),
                          title: Text(
                            q.prompt,
                            style: const TextStyle(
                              fontFamily: 'Merriweather',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              height: 1.4,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Start Quiz Button
                Center(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 14),
                      backgroundColor: era.color.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      shadowColor: Colors.black,
                      elevation: 8,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QuizScreen(era: era),
                        ),
                      );
                    },
                    icon: const Icon(Icons.play_arrow, size: 24),
                    label: const Text(
                      'Simulan ang Pagsusulit',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Merriweather',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
