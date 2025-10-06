import 'package:flutter/material.dart';

class CompetitionPlaceholder extends StatelessWidget {
  const CompetitionPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paligsahan ng Kaalaman')),
      body: const Center(
        child: Text(
          'Competition mode coming soon!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
