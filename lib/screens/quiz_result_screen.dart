import 'package:flutter/material.dart';
import '../models/era.dart';

class QuizResultScreen extends StatelessWidget {
  final Era era;
  final int score;
  final int total;

  const QuizResultScreen({
    Key? key,
    required this.era,
    required this.score,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resulta - ${era.title}')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nakakuha ka ng $score sa $total',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Bumalik sa Home'),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}
