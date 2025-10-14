import 'package:flutter/material.dart';
import 'screens/splashScreen.dart';
import 'utils/audio_manager.dart';

void main() {
  runApp(const LakbayTalinoApp());
}

class LakbayTalinoApp extends StatelessWidget {
  const LakbayTalinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lakbay Talino',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'Merriweather',
      ),
      home: const SplashScreen(), // 👈 starting point
      debugShowCheckedModeBanner: false,
    );
  }
}
