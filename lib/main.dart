import 'package:flutter/material.dart';
import 'screens/home_card_screen.dart';

void main() => runApp(HistoryQuestApp());

class HistoryQuestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lakbay Talino - Juan Quest',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: HomeScreen(),
    );
  }
}
