// lib/models/data.dart
import 'package:flutter/material.dart';

enum QType { TrueFalse, Matching }

class QuestionTF {
  final String prompt;
  final bool answer;
  QuestionTF({required this.prompt, required this.answer});
}

class MatchingPair {
  final String left;
  final String right;
  MatchingPair({required this.left, required this.right});
}

class Era {
  final String id;
  final String title;
  final String subtitle;
  final Color color;
  final String? backgroundImage; // optional asset path
  final List<QuestionTF> tfQuestions;
  final List<MatchingPair> matchingPairs;

  Era({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.color,
    this.backgroundImage,
    required this.tfQuestions,
    required this.matchingPairs,
  });
}

// --- sample data ---
final eraWWI = Era(
  id: 'wwi',
  title: 'Unang Digmaang Pandaigdig (WWI)',
  subtitle: '1914–1918',
  color: Colors.redAccent   ,
  backgroundImage: 'assets/eraBackground/wwi.png', // optional
  tfQuestions: [
    QuestionTF(prompt: 'Nagsimula ang WWI noong 1914.', answer: true),
    QuestionTF(prompt: 'Ang Allied Powers ay binubuo ng Germany, Austria-Hungary, at Ottoman Empire.', answer: false),
    QuestionTF(prompt: 'Ang pagpatay kay Archduke Franz Ferdinand ang naging mitsa ng digmaan.', answer: true),
    QuestionTF(prompt: 'Ang Estados Unidos ay sumali agad sa simula ng WWI.', answer: false),
    QuestionTF(prompt: 'Ang Treaty of Versailles ang nagtapos ng WWI.', answer: true),
  ],
  matchingPairs: [
    MatchingPair(right: 'Kaiser Wilhelm II', left: 'Pinuno ng Germany sa WWI'),
    MatchingPair(right: 'Woodrow Wilson', left: 'Pangulo ng U.S.; naglatag ng "14 Points"'),
    MatchingPair(right: 'Archduke Franz Ferdinand', left: 'Pagkamatay niya ang nag-udyok sa digmaan'),
    MatchingPair(right: 'Tsar Nicholas II', left: 'Huling Tsar ng Russia'),
    MatchingPair(right: 'Georges Clemenceau', left: 'Punong Ministro ng France na mahigpit laban sa Germany'),
  ],
);

final eraWWII = Era(
  id: 'wwii',
  title: 'Ikalawang Digmaang Pandaigdig (WWII)',
  subtitle: '1939–1945',
  color: Colors.green.shade700,
  backgroundImage: 'assets/eraBackground/wwii.png',
  tfQuestions: [
    QuestionTF(prompt: 'Nagsimula ang WWII noong 1939 sa pagsalakay ng Germany sa Poland.', answer: true),
    QuestionTF(prompt: 'Ang Axis Powers ay binubuo ng Germany, Italy, at Japan.', answer: true),
    QuestionTF(prompt: 'Si Winston Churchill ang Punong Ministro ng Britain sa simula ng WWII.', answer: false),
    QuestionTF(prompt: 'Ang Pearl Harbor attack ang dahilan ng pagpasok ng US sa WWII.', answer: true),
    QuestionTF(prompt: 'Ang D-Day invasion ay naganap sa Normandy, France.', answer: true),
  ],
  matchingPairs: [
    MatchingPair(right: 'Adolf Hitler', left: 'Diktador ng Germany (Nazi Party)'),
    MatchingPair(right: 'Benito Mussolini', left: 'Lider ng Italy (Fascism)'),
    MatchingPair(right: 'Winston Churchill', left: 'Punong Ministro ng Britain na matatag sa laban'),
    MatchingPair(right: 'Franklin D. Roosevelt', left: 'Pangulo ng Estados Unidos sa WWII'),
    MatchingPair(right: 'Joseph Stalin', left: 'Lider ng Soviet Union'),
  ],
);

final eraColdWar = Era(
  id: 'coldwar',
  title: 'Cold War',
  subtitle: '1947–1991',
  color: Colors.blue.shade700,
  backgroundImage: 'assets/eraBackground/coldwar.png',
  tfQuestions: [
    QuestionTF(prompt: 'Ang Cold War ay tuwirang digmaan sa pagitan ng US at USSR.', answer: false),
    QuestionTF(prompt: 'Ang Berlin Wall ay itinayo noong 1961.', answer: true),
    QuestionTF(prompt: 'Ang Cuban Missile Crisis ay naganap noong 1962.', answer: true),
    QuestionTF(prompt: 'Si Mikhail Gorbachev ang nagpatupad ng Glasnost at Perestroika.', answer: true),
    QuestionTF(prompt: 'Natapos ang Cold War nang bumagsak ang USSR noong 1991.', answer: true),
  ],
  matchingPairs: [
    MatchingPair(right: 'John F. Kennedy', left: 'Pangulo ng U.S. sa Cuban Missile Crisis'),
    MatchingPair(right: 'Nikita Khrushchev', left: 'Lider ng USSR sa panahon ni JFK'),
    MatchingPair(right: 'Mikhail Gorbachev', left: 'Lider ng USSR na nagpatupad ng reporma'),
    MatchingPair(right: 'Ronald Reagan', left: 'Pangulo ng U.S. na nagsabing “Mr. Gorbachev, tear down this wall!”'),
    MatchingPair(right: 'Lech Wałęsa', left: 'Lider ng Poland na tumutol sa komunismo'),
  ],
);

final allEras = [eraWWI, eraWWII, eraColdWar];
