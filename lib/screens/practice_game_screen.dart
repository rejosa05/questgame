import 'package:flutter/material.dart';
import '../models/era.dart';
import '../widgets/common_widgets.dart';
import '../models/data.dart';

class PracticeGameScreen extends StatefulWidget {
  const PracticeGameScreen({super.key});

  @override
  State<PracticeGameScreen> createState() => _PracticeGameScreenState();
}

class _PracticeGameScreenState extends State<PracticeGameScreen> {
  int totalScore = 0;
  Era currentEra = allEras.first;
  int qIndex = 0;

  void pickEra(Era era) {
    setState(() {
      currentEra = era;
      qIndex = 0;
      totalScore = 0;
    });
  }

  void proceedWithAnswer(bool correct) {
    if (correct) totalScore += 5;
    if (qIndex < currentEra.questions.length - 1) {
      setState(() => qIndex += 1);
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Natapos!'),
          content: Text('Score: $totalScore'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = currentEra.questions[qIndex];

    return Scaffold(
      appBar: AppBar(title: const Text('Laro ng Pagsasanay')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<Era>(
              value: currentEra,
              items: allEras
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.title)))
                  .toList(),
              onChanged: (v) => pickEra(v!),
            ),
            const SizedBox(height: 12),
            QuestionCard(
              question: 'Tanong ${qIndex + 1}: ${q.prompt}',
              options: [
                if (q.type == QType.TrueFalse) ...[
                  CustomButton(
                      text: 'Tama',
                      onPressed: () => proceedWithAnswer(q.answer == true)),
                  const SizedBox(height: 8),
                  CustomButton(
                      text: 'Mali',
                      onPressed: () => proceedWithAnswer(q.answer == false)),
                ] else ...[
                  CustomButton(
                      text: 'Sagutin (Auto-judge)',
                      onPressed: () => proceedWithAnswer(true)),
                ]
              ],
            ),
            const Spacer(),
            Text('Score: $totalScore',
                style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
