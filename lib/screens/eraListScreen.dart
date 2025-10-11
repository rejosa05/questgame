import 'package:flutter/material.dart';
import '../models/data.dart';
import 'eraDetailScreen.dart';

class EraListScreen extends StatelessWidget {
  const EraListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 🎨 Unique colors per era
    final List<Color> boxColors = [
      Colors.red.shade300,
      Colors.green.shade700,
      Colors.blue.shade700,
      Colors.deepPurple.shade600,
      Colors.orange.shade800,
      Colors.blueGrey.shade700,
      Colors.green.shade700,
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Pumili ng Yugto',
          style: TextStyle(
            fontFamily: 'Merriweather',
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black.withOpacity(0.3),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg-main.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.only(top: 100, left: 16, right: 16, bottom: 24),
          children: [
            // 🖼️ Top banner image
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Image.asset(
                'assets/images/mgaYugto.png',
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),

            // 🧱 Era cards with borders
            ...List.generate(allEras.length, (index) {
              final era = allEras[index];
              final color = boxColors[index % boxColors.length];
              final borderColor = darkenColor(color, 0.3); // darker border version

              return Card(
                color: color.withOpacity(0.85),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: borderColor,
                    width: 3.0, // border thickness
                  ),
                ),
                elevation: 8,
                margin: const EdgeInsets.only(bottom: 16),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 26,
                    child: Icon(era.icon, color: color, size: 28),
                  ),
                  title: Text(
                    era.title,
                    style: const TextStyle(
                      fontFamily: 'Merriweather',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    era.subtitle,
                    style: const TextStyle(
                      fontFamily: 'Merriweather',
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EraDetailScreen(era: era),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  /// 🧮 Function to darken a color for the border
  Color darkenColor(Color color, [double amount = 0.1]) {
    final hsl = HSLColor.fromColor(color);
    final darkerHsl = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return darkerHsl.toColor();
  }
}
