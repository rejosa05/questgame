import 'package:flutter/material.dart';
import 'screens/homeScreen.dart';
import 'utils/audio_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AudioManager.playBackgroundMusic(); // 🎵 starts once
  runApp(const HistoryQuestApp());
}

class HistoryQuestApp extends StatelessWidget {
  const HistoryQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lakbay Talino - Juan Quest',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
