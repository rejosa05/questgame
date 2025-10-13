// lib/screens/larong_pagsasanay.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/TFMatchmakingQuiz.dart';
import 'quizGame.dart';

class LarongPagsasanay extends StatefulWidget {
  const LarongPagsasanay({super.key});

  @override
  State<LarongPagsasanay> createState() => _LarongPagsasanayState();
}

class _LarongPagsasanayState extends State<LarongPagsasanay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  IconData _getIcon(String id) {
    switch (id) {
      case 'wwi':
        return FontAwesomeIcons.shieldHalved;
      case 'wwii':
        return FontAwesomeIcons.globe;
      case 'coldwar':
        return FontAwesomeIcons.snowflake;
      default:
        return FontAwesomeIcons.question;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Laro ng Pagsasanay',
          style: TextStyle(fontFamily: 'Merriweather'),
        ),
        backgroundColor: Colors.deepOrange.withOpacity(0.35),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg-main.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: FadeTransition(
          opacity: _animation,
          child: ListView.builder(
            padding:
            const EdgeInsets.only(top: 100, left: 16, right: 16, bottom: 24),
            itemCount: allEras.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Image.asset('assets/images/larongPagsasanay.png',
                      fit: BoxFit.contain),
                );
              }

              final era = allEras[index - 1];
              final icon = _getIcon(era.id);

              return AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  final offset = (1 - _animation.value) * 60;
                  return Transform.translate(
                    offset: Offset(0, offset * (index / allEras.length)),
                    child: Opacity(
                      opacity: _animation.value,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => QuizGame(era: era)),
                        ),
                        child: Card(
                          color: era.color.withOpacity(0.9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              color: era.color.withOpacity(0.95),
                              width: 3,
                            ),
                          ),
                          elevation: 10,
                          margin: const EdgeInsets.only(bottom: 16),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(icon, color: era.color),
                            ),
                            title: Text(
                              era.title,
                              style: const TextStyle(
                                fontFamily: 'Merriweather',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              era.subtitle,
                              style: const TextStyle(
                                fontFamily: 'Merriweather',
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
