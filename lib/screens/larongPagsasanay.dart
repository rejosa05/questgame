import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LarongPagsasanay extends StatefulWidget {
  const LarongPagsasanay({super.key});

  @override
  State<LarongPagsasanay> createState() => _LarongPagsasanayState();
}

class _LarongPagsasanayState extends State<LarongPagsasanay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<Map<String, dynamic>> quizzes = [
    {
      'title': '🕊️ Unang Digmaang Pandaigdig (WWI)',
      'subtitle': 'Subukin ang iyong kaalaman sa World War I',
      'icon': FontAwesomeIcons.shieldHalved,
      'color': Colors.red.shade400,
      'content': '''
➡️ **Subukin ang iyong galing at kumita ng puntos para sa Tagumpay Badge 🏅**

✅ **True or False**
1. Nagsimula ang WWI noong 1914. → ✅ True  
2. Ang Allied Powers ay binubuo ng Germany, Austria-Hungary, at Ottoman Empire. → ❌ False (Central Powers sila)  
3. Ang pagpatay kay Archduke Franz Ferdinand ang naging mitsa ng digmaan. → ✅ True  
4. Ang Estados Unidos ay sumali agad sa simula ng WWI. → ❌ False (1917 sila pumasok)  
5. Ang Treaty of Versailles ang nagtapos ng WWI. → ✅ True  

🔗 **Matching Type**

| Tao | Kontribusyon / Papel |
|-----|------------------------|
| Kaiser Wilhelm II | A. Pinuno ng Germany sa WWI → 1A |
| Woodrow Wilson | B. Pangulo ng U.S.; naglatag ng "14 Points" → 2B |
| Archduke Franz Ferdinand | C. Pagkamatay niya ang nag-udyok sa digmaan → 3C |
| Tsar Nicholas II | D. Huling Tsar ng Russia → 4D |
| Georges Clemenceau | E. Punong Ministro ng France na mahigpit laban sa Germany → 5E |
'''
    },
    {
      'title': '🌍 Ikalawang Digmaang Pandaigdig (WWII)',
      'subtitle': 'Pagsubok sa iyong kaalaman sa WWII',
      'icon': FontAwesomeIcons.globe,
      'color': Colors.green.shade400,
      'content': '''
✅ **True or False**
1. Nagsimula ang WWII noong 1939 sa pagsalakay ng Germany sa Poland. → ✅ True  
2. Ang Axis Powers ay binubuo ng Germany, Italy, at Japan. → ✅ True  
3. Si Winston Churchill ang Punong Ministro ng Britain sa simula ng WWII. → ❌ False (Neville Chamberlain sa simula)  
4. Ang Pearl Harbor attack ang dahilan ng pagpasok ng US sa WWII. → ✅ True  
5. Ang D-Day invasion ay naganap sa Normandy, France. → ✅ True  

🔗 **Matching Type**

| Tao | Kontribusyon / Papel |
|-----|------------------------|
| Adolf Hitler | A. Diktador ng Germany (Nazi Party) → 1A |
| Benito Mussolini | B. Lider ng Italy (Fascism) → 2B |
| Winston Churchill | C. Punong Ministro ng Britain na matatag sa laban → 3C |
| Franklin D. Roosevelt | D. Pangulo ng Estados Unidos sa WWII → 4D |
| Joseph Stalin | E. Lider ng Soviet Union → 5E |
'''
    },
    {
      'title': '❄️ Cold War',
      'subtitle': 'Hamon para sa iyong kasanayan sa Cold War',
      'icon': FontAwesomeIcons.snowflake,
      'color': Colors.blue.shade400,
      'content': '''
✅ **True or False**
1. Ang Cold War ay tuwirang digmaan sa pagitan ng US at USSR. → ❌ False (hindi tuwiran, ideolohiya at proxy wars)  
2. Ang Berlin Wall ay itinayo noong 1961. → ✅ True  
3. Ang Cuban Missile Crisis ay naganap noong 1962. → ✅ True  
4. Si Mikhail Gorbachev ang nagpatupad ng Glasnost at Perestroika. → ✅ True  
5. Natapos ang Cold War nang bumagsak ang USSR noong 1991. → ✅ True  

🔗 **Matching Type**

| Tao | Kontribusyon / Papel |
|-----|------------------------|
| John F. Kennedy | A. Pangulo ng U.S. sa Cuban Missile Crisis → 1A |
| Nikita Khrushchev | B. Lider ng USSR na nakipaglaban sa Cold War sa panahon ni JFK → 2B |
| Mikhail Gorbachev | C. Lider ng USSR na nagpatupad ng reporma → 3C |
| Ronald Reagan | D. Pangulo ng U.S. na nagsabing “Mr. Gorbachev, tear down this wall!” → 4D |
| Lech Wałęsa | E. Lider ng Poland na tumutol sa komunismo → 5E |
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
          'Laro ng Pagsasanay',
          style: TextStyle(
            fontFamily: 'Merriweather',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange.withOpacity(0.4),
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
            padding:
            const EdgeInsets.only(top: 100, left: 16, right: 16, bottom: 24),
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Image.asset(
                  'assets/images/quizHeader.png',
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              ...quizzes.map((quiz) {
                return Card(
                  color: quiz['color'].withOpacity(0.85),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(
                      color: quiz['color'].withOpacity(0.9),
                      width: 3,
                    ),
                  ),
                  elevation: 8,
                  margin: const EdgeInsets.only(bottom: 18),
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(quiz['icon'], color: quiz['color']),
                    ),
                    title: Text(
                      quiz['title'],
                      style: const TextStyle(
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      quiz['subtitle'],
                      style: const TextStyle(color: Colors.white70),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          quiz['content'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
