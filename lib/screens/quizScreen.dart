import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';
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
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    AudioManager.playBackgroundMusic();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.era.questions[currentIndex];
    final mainColor = widget.era.color;

    return Scaffold(
      extendBodyBehindAppBar: true, // 🔹 allows background behind app bar
      appBar: AppBar(
        title: Text(
          widget.era.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black87,
                offset: Offset(1, 1),
                blurRadius: 4,
              )
            ],
          ),
        ),
        backgroundColor: Colors.transparent, // fully transparent AppBar
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 🖼 Background
          Image.asset(widget.era.backgroundImage, fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.6),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // 🎉 Confetti
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: pi / 2,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              colors: [mainColor, Colors.yellow, Colors.white],
            ),
          ),

          // 🧠 Quiz Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: mainColor.withOpacity(0.9),
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
                      height: 1.4,
                      shadows: [
                        Shadow(
                          color: Colors.black54,
                          offset: Offset(1, 1),
                          blurRadius: 3,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // 🧩 Options
                  ...List.generate(currentQuestion.options.length, (i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor.withOpacity(0.9),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: mainColor.withOpacity(0.8),
                              width: 2,
                            ),
                          ),
                        ),
                        onPressed: () {
                          final correct = (i + 1) == currentQuestion.answer;

                          if (correct) {
                            score += 5;
                            AudioManager.playCorrect();
                            _confettiController.play(); // 🎉
                          } else {
                            AudioManager.playWrong();
                          }

                          Future.delayed(const Duration(seconds: 1), () {
                            if (currentIndex <
                                widget.era.questions.length - 1) {
                              setState(() => currentIndex++);
                            } else {
                              _showResult(context, mainColor);
                            }
                          });
                        },
                        child: Text(
                          currentQuestion.options[i],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🎖 Result Dialog
  void _showResult(BuildContext context, Color mainColor) {
    IconData medalIcon;
    Color medalColor;
    String message;

    if (score >= 40) {
      medalIcon = Icons.emoji_events;
      medalColor = Colors.amber;
      message = "Napakahusay! 🏆";
    } else if (score >= 25) {
      medalIcon = Icons.military_tech;
      medalColor = Colors.grey.shade400;
      message = "Magaling! 🥈";
    } else if (score >= 10) {
      medalIcon = Icons.emoji_events_outlined;
      medalColor = Colors.brown.shade400;
      message = "Pwede pa! 🥉";
    } else {
      medalIcon = Icons.sentiment_dissatisfied;
      medalColor = Colors.redAccent;
      message = "Subukan muli 😢";
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: mainColor.withOpacity(0.9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(medalIcon, color: medalColor, size: 36),
            const SizedBox(width: 8),
            const Text(
              'Tapos na ang Pagsusulit!',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Kabuuang Puntos: $score',
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
