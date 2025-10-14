import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KarununganCard extends StatelessWidget {
  const KarununganCard({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = [
      {
        'icon': FontAwesomeIcons.shieldHalved,
        'title': 'UNANG DIGMAANG PANDAIGDIG (WWI)',
        'color': Colors.red.shade400,
        'data': [
          {'q': 'Kailan nagsimula ang WWI?', 'a': '1914'},
          {'q': 'Ano ang naging mitsa ng digmaan?', 'a': 'Pagpatay kay Archduke Franz Ferdinand'},
          {'q': 'Sino ang pinuno ng Germany sa WWI?', 'a': 'Kaiser Wilhelm II'},
          {'q': 'Ano ang tawag sa alyansa ng Germany, Austria-Hungary, at Ottoman Empire?', 'a': 'Central Powers'},
          {'q': 'Ano ang kasunduan na nagtapos sa WWI?', 'a': 'Treaty of Versailles'},
        ],
      },
      {
        'icon': FontAwesomeIcons.globe,
        'title': 'IKALAWANG DIGMAANG PANDAIGDIG (WWII)',
        'color': Colors.green.shade400,
        'data': [
          {'q': 'Kailan nagsimula ang WWII?', 'a': '1939 (paglusob ng Germany sa Poland)'},
          {'q': 'Sino ang mga Axis Powers?', 'a': 'Germany, Italy, Japan'},
          {'q': 'Sino ang Punong Ministro ng Britain na nakilala sa kanyang matatag na pamumuno?', 'a': 'Winston Churchill'},
          {'q': 'Ano ang naging dahilan ng pagpasok ng U.S. sa WWII?', 'a': 'Pearl Harbor attack (Disyembre 7, 1941)'},
          {'q': 'Ano ang naging bunga ng WWII sa pandaigdigang pulitika?', 'a': 'Pagkakatatag ng United Nations'},
        ],
      },
      {
        'icon': FontAwesomeIcons.snowflake,
        'title': 'COLD WAR',
        'color': Colors.blue.shade400,
        'data': [
          {'q': 'Alin ang dalawang bansang pangunahing naglabanan sa Cold War?', 'a': 'Estados Unidos at Soviet Union (USSR)'},
          {'q': 'Ano ang pangunahing ideolohiya ng U.S.?', 'a': 'Kapitalismo at Demokrasya'},
          {'q': 'Ano ang pangunahing ideolohiya ng USSR?', 'a': 'Komunismo'},
          {'q': 'Kailan itinayo ang Berlin Wall?', 'a': '1961'},
          {'q': 'Ano ang hudyat ng pagtatapos ng Cold War?', 'a': 'Pagbagsak ng Berlin Wall (1989) at pagbuwag ng USSR (1991)'},
        ],
      },
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Karunungan Card',
          style: TextStyle(
            fontFamily: 'Merriweather',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey.withOpacity(0.4),
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
          padding:
          const EdgeInsets.only(top: 100, left: 16, right: 16, bottom: 32),
          children: [
            const Text(
              '📚 Balikan ang mga aralin at patibayin ang iyong kaalaman.',
              style: TextStyle(
                fontFamily: 'Merriweather',
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Use separate widget for animation stability
            for (var section in sections)
              AnimatedCardSection(
                icon: section['icon'] as IconData,
                title: section['title'] as String,
                color: section['color'] as Color,
                data: section['data'] as List<Map<String, String>>,
              ),
          ],
        ),
      ),
    );
  }
}

class AnimatedCardSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final List<Map<String, String>> data;

  const AnimatedCardSection({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
      tween: Tween(begin: 0, end: 1),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 40 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Card(
        color: Colors.white.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: color, width: 2),
        ),
        margin: const EdgeInsets.only(bottom: 20),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: color, size: 30),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Merriweather',
                        fontSize: 20,
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ...data.map((qa) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontFamily: 'Merriweather',
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: 'Q: ${qa['q']}\n',
                        style:
                        const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(text: 'A: ${qa['a']}'),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
