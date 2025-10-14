import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'homeScreen.dart';
// import 'main_menu.dart'; // 👉 replace with your actual main screen import

class PanimulaScreen extends StatefulWidget {
  const PanimulaScreen({super.key});

  @override
  State<PanimulaScreen> createState() => _PanimulaScreenState();
}

class _PanimulaScreenState extends State<PanimulaScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
        );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 🌄 Background
          Image.asset(
            'assets/images/bg-main.png',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          // 🌟 Content
          SafeArea(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 📘 Logo or image
                      Image.asset(
                        'assets/images/logogame.png', // replace with your logo
                        height: 250,
                      ),
                      const SizedBox(height: 40),

                      const Text(
                        'Maligayang Pagdating sa',
                        style: TextStyle(
                          fontFamily: 'Merriweather',
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      ),
                      const Text(
                        'LAKBAY TALINO',
                        style: TextStyle(
                          fontFamily: 'Merriweather',
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Tuklasin ang kasaysayan sa masayang paraan.\n'
                            'Pumili ng yugto, maglaro, at matuto!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Merriweather',
                          color: Colors.white70,
                          fontSize: 16,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 60),

                      // 🟠 Button
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 6,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomeScreen()), // your main screen
                          );
                        },
                        icon: const Icon(FontAwesomeIcons.arrowRight,
                            color: Colors.white),
                        label: const Text(
                          'Simulan',
                          style: TextStyle(
                            fontFamily: 'Merriweather',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
