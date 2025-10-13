// lib/screens/quiz_game.dart
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';
import '../models/TFMatchmakingQuiz.dart';

class QuizGame extends StatefulWidget {
  final Era era;
  const QuizGame({super.key, required this.era});

  @override
  State<QuizGame> createState() => _QuizGameState();
}

class _QuizGameState extends State<QuizGame> {
  // True/False flow
  int tfIndex = 0;
  int tfScore = 0;

  // Matching flow
  late List<MatchingPair> pairs; // left->right correct mapping
  late List<String> shuffledRights; // choices for dropdowns
  Map<String, String?> selectedMatches = {}; // left -> chosen right
  int matchingScore = 0;

  // overall
  late ConfettiController _confettiController;

  bool showMatchingSection = false;
  bool finished = false;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 1));
    // prepare matching data
    pairs = List.from(widget.era.matchingPairs);
    shuffledRights = pairs.map((p) => p.right).toList();
    shuffledRights.shuffle();
    for (var p in pairs) selectedMatches[p.left] = null;
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void answerTF(bool value) {
    final correct = widget.era.tfQuestions[tfIndex].answer;
    if (value == correct) {
      tfScore += 5;
      _confettiController.play();
    }
    setState(() {
      if (tfIndex < widget.era.tfQuestions.length - 1) {
        tfIndex++;
      } else {
        // move to matching section
        showMatchingSection = true;
      }
    });
  }

  void submitMatching() {
    matchingScore = 0;
    for (var p in pairs) {
      final choice = selectedMatches[p.left];
      if (choice != null && choice == p.right) matchingScore += 5;
    }
    finished = true;
    setState(() {});
    _showResult();
  }

  void _showResult() {
    final total = tfScore + matchingScore;
    IconData medal;
    Color medalColor;
    String message;
    if (total >= 40) {
      medal = Icons.emoji_events;
      medalColor = Colors.amber;
      message = 'Napakahusay! 🏆';
    } else if (total >= 25) {
      medal = Icons.military_tech;
      medalColor = Colors.grey;
      message = 'Magaling! 🥈';
    } else if (total >= 10) {
      medal = Icons.emoji_events_outlined;
      medalColor = Colors.brown;
      message = 'Pwede pa! 🥉';
    } else {
      medal = Icons.sentiment_dissatisfied;
      medalColor = Colors.redAccent;
      message = 'Subukan muli 😢';
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: widget.era.color.withOpacity(0.95),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(medal, color: medalColor, size: 36),
            const SizedBox(width: 8),
            const Text('Resulta', style: TextStyle(fontFamily: 'Merriweather', color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('True/False Score: $tfScore', style: const TextStyle(fontFamily: 'Merriweather', color: Colors.white)),
            Text('Matching Score: $matchingScore', style: const TextStyle(fontFamily: 'Merriweather', color: Colors.white)),
            const SizedBox(height: 8),
            Text('Kabuuang Puntos: $total', style: const TextStyle(fontFamily: 'Merriweather', color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(message, style: const TextStyle(fontFamily: 'Merriweather', color: Colors.white)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // back to era list
            },
            child: const Text('Bumalik', style: TextStyle(fontFamily: 'Merriweather', color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              // restart quiz
              Navigator.pop(context);
              setState(() {
                tfIndex = 0;
                tfScore = 0;
                matchingScore = 0;
                finished = false;
                showMatchingSection = false;
                shuffledRights = pairs.map((p) => p.right).toList()..shuffle();
                selectedMatches.updateAll((key, value) => null);
              });
            },
            child: const Text('Subukan Muli', style: TextStyle(fontFamily: 'Merriweather', color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final era = widget.era;
    return Scaffold(
      appBar: AppBar(
        title: Text(era.title, style: TextStyle(fontFamily: 'Merriweather'),),
        backgroundColor: era.color.withOpacity(0.85),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (era.backgroundImage != null) Image.asset(era.backgroundImage!, fit: BoxFit.cover),
          Container(color: Colors.black.withOpacity(0.5)),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // header
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: era.color.withOpacity(0.9), borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(era.title, style: const TextStyle(fontFamily: 'Merriweather', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(era.subtitle, style: const TextStyle(fontFamily: 'Merriweather', color: Colors.white70)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // True/False Section
                  if (!showMatchingSection) ...[
                    const Text('✅ True or False', style: TextStyle(fontFamily: 'Merriweather', fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 12),
                    Card(
                      color: Colors.white.withOpacity(0.06),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              widget.era.tfQuestions[tfIndex].prompt,
                              style: const TextStyle(fontFamily: 'Merriweather', color: Colors.white, fontSize: 16),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: era.color),
                                    onPressed: () => answerTF(true),
                                    child: const Text('TRUE', style: TextStyle(fontFamily: 'Merriweather', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: era.color.withOpacity(0.8)),
                                    onPressed: () => answerTF(false),
                                    child: const Text('FALSE', style: TextStyle(fontFamily: 'Merriweather', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text('Score (TF): $tfScore', style: const TextStyle(fontFamily: 'Merriweather', color: Colors.white70)),
                            const SizedBox(height: 8),
                            LinearProgressIndicator(
                              value: (tfIndex + 1) / widget.era.tfQuestions.length,
                              color: era.color,
                              backgroundColor: Colors.white12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],

                  // Matching Section
                  if (showMatchingSection) ...[
                    const SizedBox(height: 8),
                    const Text('🔗 Matching Type', style: TextStyle(fontFamily: 'Merriweather', fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 12),
                    Card(
                      color: Colors.white.withOpacity(0.06),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            // show list of left items with dropdowns
                            for (var p in pairs)
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Text(p.left, style: const TextStyle(fontFamily: 'Merriweather', color: Colors.white)),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.95),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          value: selectedMatches[p.left],
                                          hint: const Text('Piliin', style: TextStyle(fontFamily: 'Merriweather', color: Colors.black87)),
                                          underline: const SizedBox.shrink(),
                                          items: shuffledRights.map((r) {
                                            return DropdownMenuItem(
                                              value: r,
                                              child: Text(r, style: const TextStyle(color: Colors.black87)),
                                            );
                                          }).toList(),
                                          onChanged: (v) {
                                            setState(() {
                                              // simple: allow using same right for multiple lefts
                                              selectedMatches[p.left] = v;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            const SizedBox(height: 12),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: era.color),
                              onPressed: submitMatching,
                              child: const Text('Isumite ang Matching'),
                            ),
                            const SizedBox(height: 8),
                            Text('Matching Score: $matchingScore', style: const TextStyle(fontFamily: 'Merriweather', color: Colors.white70)),
                          ],
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 20),

                  // footer score when finished
                  if (finished)
                    Center(
                      child: Text('Kabuuang Score: ${tfScore + matchingScore}', style: TextStyle(fontFamily: 'Merriweather', fontSize: 18, fontWeight: FontWeight.bold, color: era.color)),
                    ),
                ],
              ),
            ),
          ),
          // confetti overlay
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: pi / 2,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              maxBlastForce: 20,
              minBlastForce: 5,
              shouldLoop: false,
              colors: [era.color, Colors.white, Colors.yellow],
            ),
          ),
        ],
      ),
    );
  }
}
