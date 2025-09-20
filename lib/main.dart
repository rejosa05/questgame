// Flutter single-file quest-style history quiz app
// Save as lib/main.dart in a new Flutter project

import 'package:flutter/material.dart';

void main() => runApp(HistoryQuestApp());

class HistoryQuestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lakbay Talino - History Quest',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: HomeScreen(),
    );
  }
}

// --- Data models ---
class Era {
  final String id;
  final String title;
  final String subtitle;
  final List<Question> questions;

  Era({required this.id, required this.title, required this.subtitle, required this.questions});
}

enum QType { TrueFalse, MultipleChoice, Matching }

class Question {
  final String prompt;
  final QType type;
  final List<String> options; // for MCQ and matching targets
  final dynamic answer; // bool for TF, int for MCQ index, Map for matching

  Question({required this.prompt, required this.type, required this.options, required this.answer});
}

// --- Sample data translated from user's menu content ---
final eraWWI = Era(
  id: 'wwi',
  title: 'Unang Digmaang Pandaigdig (WWI)',
  subtitle: '1914–1918',
  questions: [
    Question(
      prompt: 'Nagsimula ang WWI noong 1914.',
      type: QType.TrueFalse,
      options: [],
      answer: true,
    ),
    Question(
      prompt: 'Sino ang pinuno ng Germany noong WWI?',
      type: QType.MultipleChoice,
      options: ['Adolf Hitler', 'Kaiser Wilhelm II', 'Joseph Stalin', 'Napoleon III'],
      answer: 1,
    ),
    Question(
      prompt: 'Itugma ang mga tao sa kanilang kontribusyon',
      type: QType.Matching,
      options: ['Kaiser Wilhelm II', 'Woodrow Wilson', 'Archduke Franz Ferdinand', 'Tsar Nicholas II'],
      answer: {
        'Kaiser Wilhelm II': 'Pinuno ng Germany sa WWI',
        'Woodrow Wilson': 'Naglatag ng 14 Points',
        'Archduke Franz Ferdinand': 'Pagkamatay niya ang nag-udyok sa digmaan',
        'Tsar Nicholas II': 'Huling Tsar ng Russia'
      },
    ),
  ],
);

final eraWWII = Era(
  id: 'wwii',
  title: 'Ikalawang Digmaang Pandaigdig (WWII)',
  subtitle: '1939–1945',
  questions: [
    Question(
      prompt: 'Nagsimula ang WWII noong 1939 sa pagsalakay ng Germany sa Poland.',
      type: QType.TrueFalse,
      options: [],
      answer: true,
    ),
    Question(
      prompt: 'Sino ang lider ng Nazi Germany?',
      type: QType.MultipleChoice,
      options: ['Benito Mussolini', 'Adolf Hitler', 'Joseph Stalin', 'Winston Churchill'],
      answer: 1,
    ),
  ],
);

final eraColdWar = Era(
  id: 'coldwar',
  title: 'Cold War (Digmaang Malam)',
  subtitle: '1947–1991',
  questions: [
    Question(
      prompt: 'Ang Cold War ay isang tuwirang digmaan sa pagitan ng US at USSR.',
      type: QType.TrueFalse,
      options: [],
      answer: false,
    ),
    Question(
      prompt: 'Ano ang dalawang bansang pangunahing naglabanan sa Cold War?',
      type: QType.MultipleChoice,
      options: ['Germany at Italy', 'USA at USSR', 'Britain at France', 'China at Japan'],
      answer: 1,
    ),
  ],
);

final allEras = [eraWWI, eraWWII, eraColdWar];

// --- Home Screen (Main Menu) ---
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lakbay Talino')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('Panimula ng Aplikasyon'),
                subtitle: Text('Kilalanin ang iyong misyon at simulan ang paglalakbay.'),
                onTap: () => showIntroDialog(context),
              ),
            ),
            SizedBox(height: 12),
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.map),
                title: Text('Lakbay Talino'),
                subtitle: Text('Pumili ng yugto ng kasaysayan'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => EraListScreen())),
              ),
            ),
            SizedBox(height: 12),
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.videogame_asset),
                title: Text('Laro ng Pagsasanay'),
                subtitle: Text('Subukin ang iyong galing at kumita ng puntos'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PracticeGameScreen())),
              ),
            ),
            SizedBox(height: 12),
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.emoji_events),
                title: Text('Paligsahan ng Kaalaman'),
                subtitle: Text('Makipagsabayan sa iba!'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CompetitionPlaceholder())),
              ),
            ),
            SizedBox(height: 12),
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.book),
                title: Text('Karunungan Card - Review'),
                subtitle: Text('Balikan ang mga aralin at patibayin ang iyong kaalaman.'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => KnowledgeCardScreen())),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showIntroDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Panimula'),
        content: Text('Maligayang pagdating sa Lakbay Talino! Piliin ang yugto at simulan ang hamon.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Sige'))
        ],
      ),
    );
  }
}

// --- Era list and details ---
class EraListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pumili ng Yugto')),
      body: ListView.builder(
        itemCount: allEras.length,
        itemBuilder: (context, index) {
          final era = allEras[index];
          return Card(
            child: ListTile(
              title: Text(era.title),
              subtitle: Text(era.subtitle),
              trailing: Icon(Icons.chevron_right),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => EraDetailScreen(era: era))),
            ),
          );
        },
      ),
    );
  }
}

class EraDetailScreen extends StatelessWidget {
  final Era era;
  EraDetailScreen({required this.era});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(era.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(era.subtitle, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            SizedBox(height: 12),
            Text('Mga Latag at Paliwanag (maikling buod)', style: TextStyle(fontSize: 14)),
            SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  Text('Mga Tanong: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  ...era.questions.map((q) => ListTile(title: Text(q.prompt))).toList(),
                ],
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: Text('Simulan ang Antas (Quiz)'),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => QuizScreen(era: era))),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  child: Icon(Icons.play_arrow),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PracticeGameScreen())),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// --- Quiz Screen ---
class QuizScreen extends StatefulWidget {
  final Era era;
  QuizScreen({required this.era});
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int index = 0;
  int score = 0;
  Map<String, String> matchingAnswers = {};

  void answerTF(bool value) {
    final q = widget.era.questions[index];
    if (q.answer == value) score += 10;
    nextQuestion();
  }

  void answerMCQ(int selected) {
    final q = widget.era.questions[index];
    if (q.answer == selected) score += 10;
    nextQuestion();
  }

  void submitMatching() {
    final q = widget.era.questions[index];
    final correctMap = Map<String, String>.from(q.answer);
    int got = 0;
    correctMap.forEach((left, right) {
      if (matchingAnswers[left] == right) got += 1;
    });
    score += (got * 5);
    nextQuestion();
  }

  void nextQuestion() {
    if (index < widget.era.questions.length - 1) {
      setState(() {
        index += 1;
        matchingAnswers.clear();
      });
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => QuizResultScreen(score: score, era: widget.era)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.era.questions[index];
    return Scaffold(
      appBar: AppBar(title: Text('${widget.era.title} — Tanong ${index + 1}/${widget.era.questions.length}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(q.prompt, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 18),
            if (q.type == QType.TrueFalse) ...[
              ElevatedButton(onPressed: () => answerTF(true), child: Text('True')),
              SizedBox(height: 8),
              ElevatedButton(onPressed: () => answerTF(false), child: Text('False')),
            ],
            if (q.type == QType.MultipleChoice) ...[
              ...List.generate(q.options.length, (i) {
                return Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: ElevatedButton(
                    onPressed: () => answerMCQ(i),
                    child: Align(alignment: Alignment.centerLeft, child: Text(q.options[i])),
                  ),
                );
              })
            ],
            if (q.type == QType.Matching) ...[
              Text('Itugma ang kaliwa at kanan (pumili ng akmang tugma para sa bawat isa).'),
              SizedBox(height: 8),
              ...q.answer.keys.map<Widget>((left) {
                final targets = q.answer.values.toList().cast<String>();
                return Card(
                  child: ListTile(
                    title: Text(left),
                    trailing: DropdownButton<String>(
                      value: matchingAnswers[left],
                      hint: Text('Piliin'),
                      items: targets.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                      onChanged: (v) {
                        setState(() {
                          matchingAnswers[left] = v!;
                        });
                      },
                    ),
                  ),
                );
              }).toList(),
              SizedBox(height: 12),
              ElevatedButton(onPressed: submitMatching, child: Text('Isumite'))
            ]
          ],
        ),
      ),
    );
  }
}

class QuizResultScreen extends StatelessWidget {
  final int score;
  final Era era;
  QuizResultScreen({required this.score, required this.era});

  String badgeForScore(int s) {
    if (s >= 30) return 'Tagumpay Badge 🏅';
    if (s >= 15) return 'Galing Badge 🌟';
    return 'Baguhan Badge 🌱';
  }

  @override
  Widget build(BuildContext context) {
    final badge = badgeForScore(score);
    return Scaffold(
      appBar: AppBar(title: Text('Resulta - ${era.title}')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Iskor: $score', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text('Nakatanggap ka ng: $badge', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => Navigator.popUntil(context, (route) => route.isFirst), child: Text('Bumalik sa Menu')),
            SizedBox(height: 8),
            ElevatedButton(onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => QuizScreen(era: era))), child: Text('Subukan Muli')),
          ],
        ),
      ),
    );
  }
}

// --- Practice Game Screen (simple timed quiz) ---
class PracticeGameScreen extends StatefulWidget {
  @override
  _PracticeGameScreenState createState() => _PracticeGameScreenState();
}

class _PracticeGameScreenState extends State<PracticeGameScreen> {
  int totalScore = 0;
  Era currentEra = eraWWI;
  int qIndex = 0;

  void pickRandomEra(Era era) {
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
      showDialog(context: context, builder: (_) => AlertDialog(
        title: Text('Natapos!'),
        content: Text('Score: $totalScore'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
        ],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = currentEra.questions[qIndex];
    return Scaffold(
      appBar: AppBar(title: Text('Laro ng Pagsasanay')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<Era>(
              value: currentEra,
              items: allEras.map((e) => DropdownMenuItem(value: e, child: Text(e.title))).toList(),
              onChanged: (v) => pickRandomEra(v!),
            ),
            SizedBox(height: 12),
            Text('Tanong ${qIndex + 1}: ${q.prompt}'),
            SizedBox(height: 12),
            if (q.type == QType.TrueFalse) ...[
              ElevatedButton(onPressed: () => proceedWithAnswer(q.answer == true), child: Text('True')),
              ElevatedButton(onPressed: () => proceedWithAnswer(q.answer == false), child: Text('False')),
            ] else ...[
              ElevatedButton(onPressed: () => proceedWithAnswer(true), child: Text('Sagutin (I-judge automatic)'))
            ],
            Spacer(),
            Text('Score: $totalScore')
          ],
        ),
      ),
    );
  }
}

// --- Competition placeholder ---
class CompetitionPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Paligsahan ng Kaalaman')),
      body: Center(child: Text('Feature coming soon — multiplayer leaderboard placeholder.')),
    );
  }
}

// --- Knowledge Card Screen ---
class KnowledgeCardScreen extends StatelessWidget {
  Widget buildCard(String title, String text) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(text),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Karunungan Card - Review')),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          buildCard('WWI - Mahahalagang Punto', 'Nagsimula 1914; Trigger: Pagpaslang kay Archduke Franz Ferdinand; Natapos 1918; Treaty of Versailles (1919).'),
          buildCard('WWII - Mahahalagang Punto', 'Nagsimula 1939; Pearl Harbor 1941; D-Day 1944; Japan sumuko 1945; United Nations itinatag.'),
          buildCard('Cold War - Mahahalagang Punto', 'Ideolohikal na tunggalian; Berlin Wall 1961; Cuban Missile Crisis 1962; Pagbagsak 1989-1991.'),
        ],
      ),
    );
  }
}

