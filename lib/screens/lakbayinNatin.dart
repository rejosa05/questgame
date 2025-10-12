import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'yugtoDetail.dart';

class LakbayinNatin extends StatefulWidget {
  const LakbayinNatin({super.key});

  @override
  State<LakbayinNatin> createState() => _LakbayinNatinState();
}

class _LakbayinNatinState extends State<LakbayinNatin>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<Map<String, dynamic>> eras = [
    {
      'title': 'Unang Digmaang Pandaigdig (Antas 1)',
      'subtitle': 'World War I (1914–1918)',
      'icon': FontAwesomeIcons.shieldHalved,
      'color': Colors.red.shade400,
      'details': '''  
🪖 **Unang Digmaang Pandaigdig (World War I, 1914–1918)**  

**Mga Dahilan**

• Militarismo – paligsahan sa armas  
• Alyansa – Triple Entente (Britain, France, Russia) vs. Triple Alliance (Germany, Austria-Hungary, Italy)  
• Imperyalismo – agawan sa kolonya  
• Nasyonalismo – pagnanais ng mga bansa sa Balkans na maging malaya  
• Trigger: Hunyo 28, 1914 – Pagpaslang kay Archduke Franz Ferdinand ng Austria sa Sarajevo  

**Mahahalagang Petsa at Kaganapan**  
• Agosto 1914 – Germany umatake sa Belgium; nagsimula ang digmaan  
• 1915 – Lumubog ang Lusitania; pumasok ang US (1917)  
• 1916 – Labanan sa Verdun at Somme  
• Nobyembre 11, 1918 – Armistice Day  

**Tanyag na Tao**  
Kaiser Wilhelm II – emperador ng Germany; agresibong patakarang militar. 
Woodrow Wilson – Pangulo ng US; nagmungkahi ng Fourteen Points at League of Nations. 
Vladimir Lenin – nagpasimula ng Rebolusyong Ruso, nagpatigil sa pakikidigma ng Russia. 
General Ferdinand Foch – heneral ng Allied Forces; tumanggap ng pagsuko ng Germany.   

**Resulta**  
Pagbagsak ng mga imperyo, Kasunduan sa Versailles, League of Nations, mitsa ng WWII.
'''
    },
    {
      'title': 'Ikalawang Digmaang Pandaigdig (Antas 2)',
      'subtitle': 'World War II (1939–1945)',
      'icon': FontAwesomeIcons.globe,
      // 'icon': FontAwesomeIcons.explosion,
      'color': Colors.green.shade400,
      'details': '''
🌍 **Ikalawang Digmaang Pandaigdig (World War II, 1939–1945)**  

**Mga Dahilan**  
• Kasunduan sa Versailles – sobrang parusa sa Germany  
• Pag-angat ng Pasismo (Hitler, Mussolini) at Militarismo (Japan)  
• Pagpalya ng League of Nations  
• Paglusob ng Germany sa Poland (Setyembre 1, 1939)  

**Mahahalagang Petsa at Kaganapan**  
• Setyembre 1939 – Germany umatake sa Poland  
• 1941 – Pearl Harbor; US pumasok sa digmaan  
• Hunyo 6, 1944 – D-Day  
• Agosto 1945 – Hiroshima at Nagasaki  
• Setyembre 2, 1945 – Japan sumuko  

**Tanyag na Tao**  
Hitler, Mussolini, Churchill, Roosevelt, Truman, Stalin, Eisenhower  

**Resulta**  
Mahigit 60M namatay, UN itinatag, Germany nahati, simula ng Cold War.
'''
    },
    {
      'title': 'Cold War (Antas 3)',
      'subtitle': 'US vs USSR (1947–1991)',
      // 'icon': FontAwesomeIcons.satellite,
      'icon': FontAwesomeIcons.snowflake,
      'color': Colors.blue.shade400,
      'details': '''
🛰 **Cold War (1947–1991)**  

**Mga Dahilan**  
• Kapitalismo (US) vs. Komunismo (USSR)  
• Arms race, Space race, ideolohiyang labanan  

**Mahahalagang Petsa at Kaganapan**  
• 1947 – Truman Doctrine, Marshall Plan  
• 1950–1953 – Korean War  
• 1961 – Berlin Wall  
• 1962 – Cuban Missile Crisis  
• 1969 – Apollo 11 Moon Landing  
• 1989 – Pagbagsak ng Berlin Wall  
• 1991 – Wakas ng USSR  

**Tanyag na Tao**  
Truman, Kennedy, Reagan, Stalin, Khrushchev, Gorbachev  

**Resulta**  
Pagwawakas ng USSR, tagumpay ng kapitalismo, US bilang superpower.
'''
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Lakbay Talino - Mga Yugto',
          style: TextStyle(fontFamily: 'Merriweather', fontWeight: FontWeight.bold, color: Colors.white ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange.withOpacity(0.3),
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
          child: ListView(
            padding: const EdgeInsets.only(top: 80, left: 16, right: 16, bottom: 24),
            children: [
              // 🔹 IMAGE HEADER AT THE TOP
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Image.asset(
                  'assets/images/mgaYugto.png',
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),

              // 🔹 LIST OF ERA CARDS
              ...eras.asMap().entries.map((entry) {
                final index = entry.key;
                final era = entry.value;

                return AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    final offset = (1 - _animation.value) * 50;
                    return Transform.translate(
                      offset: Offset(0, offset * (index + 1) / eras.length),
                      child: Opacity(
                        opacity: _animation.value,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(18),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => YugtoDetail(
                                  title: era['title'],
                                  color: era['color'],
                                  details: era['details'],
                                  icon: era['icon'],
                                ),
                              ),
                            );
                          },
                          child: Card(
                            color: era['color'].withOpacity(0.85),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                              side: BorderSide(
                                color: era['color'].withOpacity(0.9),
                                width: 3,
                              ),
                            ),
                            elevation: 10,
                            margin: const EdgeInsets.only(bottom: 18),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 26,
                                    child: Icon(
                                      era['icon'],
                                      color: era['color'],
                                      size: 26,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          era['title'],
                                          style: const TextStyle(
                                            fontFamily: 'Merriweather',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          era['subtitle'],
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
