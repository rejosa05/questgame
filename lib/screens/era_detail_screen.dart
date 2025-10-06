import 'package:flutter/material.dart';
import '../models/era.dart';
import 'quiz_screen.dart';

class EraDetailScreen extends StatelessWidget {
  final Era era;
  const EraDetailScreen({super.key, required this.era});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(era.title),
        backgroundColor: Colors.black54,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 👉 Background based on era
          Image.asset(
            era.backgroundImage,
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black54), // overlay para readable text

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  era.subtitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Mga Tanong (Preview):',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),

                // 👉 List of questions
                Expanded(
                  child: ListView.separated(
                    itemCount: era.questions.length,
                    separatorBuilder: (_, __) =>
                    const Divider(color: Colors.white30),
                    itemBuilder: (context, index) {
                      final q = era.questions[index];
                      return ListTile(
                        leading: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.indigoAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Q${index + 1}', // 👉 Badge style
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          q.prompt,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      backgroundColor: Colors.brown,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QuizScreen(era: era), // same background
                        ),
                      );
                    },
                    icon: const Icon(Icons.play_arrow),
                    label: const Text(
                      'Simulan ang Pagsusulit',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
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
