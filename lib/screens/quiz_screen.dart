import 'package:flutter/material.dart';
import '../models/era.dart';

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
          // 👉 Same background as the selected era
          Image.asset(
            widget.era.backgroundImage,
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black54),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 👉 Question Badge
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
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // 👉 Question text
                Text(
                  currentQuestion.prompt,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                // 👉 Answer buttons
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
                        final correct =
                            (i + 1) == currentQuestion.answer; // 1-based
                        if (correct) score += 5; // you can adjust point system

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
              Navigator.pop(context); // close dialog
              Navigator.pop(context); // back to era detail
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
