import 'package:flutter/material.dart';
import '../models/era.dart';
import '../utils/audio_manager.dart';

class QuizScreen extends StatefulWidget {
  final Era era;
  const QuizScreen({super.key, required this.era});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    // 🎵 Restart background music when quiz starts
    AudioManager.playBackgroundMusic();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.era.questions[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.era.title),
        backgroundColor: Colors.black54,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(widget.era.backgroundImage, fit: BoxFit.cover),
          Container(color: Colors.black54),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Tanong ${currentIndex + 1}/${widget.era.questions.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  currentQuestion.prompt,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                ...List.generate(currentQuestion.options.length, (i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 14),
                      ),
                      onPressed: () {
                        final correct = (i + 1) == currentQuestion.answer;
                        if (correct) {
                          score += 5;
                          AudioManager.playCorrect(); // ✅ sound
                        } else {
                          AudioManager.playWrong(); // ❌ sound
                        }

                        if (currentIndex < widget.era.questions.length - 1) {
                          setState(() => currentIndex++);
                        } else {
                          _showResult(context);
                        }
                      },
                      child: Text(
                        currentQuestion.options[i],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showResult(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Tapos na ang Pagsusulit!'),
        content: Text('Kabuuang puntos: $score'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}