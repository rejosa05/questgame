import 'era.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// --- WORLD HISTORY SAMPLE ---
final eraWWI = Era(
  id: 'wwi',
  title: 'Unang Digmaang Pandaigdig (World War I)',
  backgroundImage: 'assets/eraBackground/wwi.png',
  subtitle: '1914–1918',
  questions: [
    // Simple Question score points per correct is 5pts
    Question(
      prompt: 'Kailan nagsimula ang Unang Digmaang Pandaigdig?',
      type: QType.MultipleChoice,
      options: [
        'A. 1910',
        'B. 1914',
        'C. 1916',
        'D. 1918'
      ],
      answer: 3,
    ),
    Question(
      prompt: 'Ano ang pangunahing dahilan ng pagsiklab ng WWI?',
      type: QType.MultipleChoice,
      options: [
        'A. Pagbagsak ng Ekonomiya',
        'B. Pagpatay kay Archduke Franz Ferdinand',
        'C. Paglusob ng Germany sa Poland',
        'D. Labanan sa Pearl Harbor',
      ],
      answer: 3,
    ),
    Question(
      prompt: 'Alin ang tawag sa alyansa ng Germany, Austria-Hungary, at Ottoman Empire?',
      type: QType.MultipleChoice,
      options: [
        'A. Allied Powers',
        'B. Axis Powers',
        'C. Central Powers',
        'D. United Nations'
      ],
      answer: 4,
    ),
    Question(
      prompt: 'Ano ang pangunahing dahilan ng pagsiklab ng WWI?',
      type: QType.MultipleChoice,
      options: [
        'A. Pagbagsak ng Ekonomiya',
        'B. Pagpatay kay Archduke Franz Ferdinand',
        'C. Paglusob ng Germany sa Poland',
        'D. Labanan sa Pearl Harbor',
      ],
      answer: 3,
    ),
    Question(
      prompt: 'Ano ang tawag sa mapayapang kasunduang nagtapos sa WWI?',
      type: QType.MultipleChoice,
      options: [
        'A. Treaty of Paris',
        'B. Treaty of Versailles',
        'C. Yalta Conference',
        'D. Potsdam Agreement',
      ],
      answer: 3,
    ),
    Question(
      prompt: 'Sino ang pinuno ng Germany noong WWI?',
      type: QType.MultipleChoice,
      options: [
        'A. Adolf Hitler',
        'B. Kaiser Wilhelm II',
        'C. Joseph Stalin',
        'D. Napoleon III'
      ],
      answer: 3,
    ),
    // Average Question score points per correct is 10pts
    Question(
      prompt: 'Anong bansa ang unang gumamit ng poison gas sa WWI?',
      type: QType.MultipleChoice,
      options: [
        'A. Russia',
        'B. France',
        'C. Germany',
        'D. Britain'
      ],
      answer: 4,
    ),
    Question(
      prompt: 'Saan naganap ang kilalang Battle of the Somme?',
      type: QType.MultipleChoice,
      options: [
        'A. Russia',
        'B. France',
        'C. Italy',
        'D. Austria'
      ],
      answer: 3,
    ),
    Question(
      prompt: 'Anong barko ang nilubog ng German U-boat na ikinagalit ng Amerika?',
      type: QType.MultipleChoice,
      options: [
        'A. Titanic',
        'B. Lusitania',
        'C. Bismarck',
        'D. Yorktown'
      ],
      answer: 3,
    ),
    Question(
      prompt: 'Kailan pumasok ang Estados Unidos sa WWI?',
      type: QType.MultipleChoice,
      options: [
        'A. 1914',
        'B. 1917',
        'C. 1918',
        'D. 1920'
      ],
      answer: 3,
    ),
    // Difficult Question score points per correct is 5pts
    Question(
      prompt: 'Anong prinsipyong politikal ang itinaguyod ni Woodrow Wilson?',
      type: QType.MultipleChoice,
      options: [
        'A. Truman Doctrine',
        'B. 14 Points',
        'C. League Charter',
        'D. Atlantic Charter',
      ],
      answer: 3,
    ),
    Question(
      prompt: 'Anong prinsipyong politikal ang itinaguyod ni Woodrow Wilson?',
      type: QType.MultipleChoice,
      options: [
        'A. Truman Doctrine',
        'B. 14 Points',
        'C. League Charter',
        'D. Atlantic Charter'
      ],
      answer: 3,
    ),
    Question(
      prompt: 'Ano ang pangunahing dahilan ng Italy sa paglipat mula sa Central Powers tungo sa Allied Powers?',
      type: QType.MultipleChoice,
      options: [
        'A. Mas malaking teritoryo ang ipinangako',
        'B. Pagkakaibigan sa France',
        'C. Pagbagsak ng ekonomiya',
        'D. Udyok ng Amerika'
      ],
      answer: 2,
    ),
    Question(
      prompt: 'Ano ang kahulugan ng "No Man’s Land"?',
      type: QType.MultipleChoice,
      options: [
        'A. Teritoryo ng mga kaalyado',
        'B. Gitnang lugar sa pagitan ng magkatunggaling okopa na lubhang mapanganib',
        'C. Neutral na bansa',
        'D. Lupang sakop ng Ottoman'
      ],
      answer: 3,
    ),
    Question(
      prompt: 'Ano ang epekto ng Treaty of Versailles sa Germany?',
      type: QType.MultipleChoice,
      options: [
        'A. Nakaligtas sila sa pagbabayad',
        'B. Pinalakas ang kanilang hukbo',
        'C. Pinilit silang magbayad ng reparations at limitahan ang militar',
        'D. Nadagdagan ang kanilang teritoryo'
      ],
      answer: 4,
    ),
    Question(
      prompt: 'Sino ang kilalang nurse na nagbigay ng malaking tulong sa mga sundalo?',
      type: QType.MultipleChoice,
      options: [
        'A. Marie Curie',
        'B. Florence Nightingale',
        'C. Clara Barton',
        'D. Edith Cavell'
      ],
      answer: 2,
    ),
  ],
  color: Colors.redAccent,
  icon: FontAwesomeIcons.shieldHalved,
);

final eraWWII = Era(
  id: 'wwii',
  title: 'Ikalawang Digmaang Pandaigdig (World War II)',
  backgroundImage: 'assets/eraBackground/wwii.png',
  subtitle: '1939–1945',
  questions: [
    Question(
      prompt:
      'Kailan nagsimula ang WWII?',
      type: QType.MultipleChoice,
      options: [
        'A. Poland',
        'B. France',
        'C. Britain',
        'D. Belgium'
      ],
      answer: 2,
    ),
    Question(
      prompt:
      'Sino ang diktador ng Germany?',
      type: QType.MultipleChoice,
      options: [
        'A. Benito Mussolini',
        'B. Adolf Hitler',
        'C. Joseph Stalin',
        'D. Winston Churchill'
      ],
      answer: 3,
    ),
    Question(
      prompt:
      'Ano ang pangalan ng alyansang binuo ng Germany, Italy, at Japan?',
      type: QType.MultipleChoice,
      options: [
        'A. Central Powers',
        'B. Axis Powers',
        'C. Allied Forces',
        'D. NATO'
      ],
      answer: 3,
    ),
    Question(
      prompt:
      'Ano ang tinaguriang turning point ng laban sa Pasipiko?',
      type: QType.MultipleChoice,
      options: [
        'A. Pearl Harbor',
        'B. Battle of Midway',
        'C. Battle of Stalingrad',
        'D. D-Day'
      ],
      answer: 3,
    ),
    // Average
    Question(
      prompt:
      'Kailan sinalakay ng Japan ang Pearl Harbor?',
      type: QType.MultipleChoice,
      options: [
        'A. Disyembre 7, 1941',
        'B. Setyembre 1, 1939',
        'C. Hunyo 6, 1944',
        'D. Agosto 6, 1945'
      ],
      answer: 2,
    ),
    Question(
      prompt:
      'Sino ang Punong Ministro ng Britain noong WWII?',
      type: QType.MultipleChoice,
      options: [
        'A. Neville Chamberlain',
        'B. Winston Churchill',
        'C. Franklin Roosevelt',
        'D. Charles de Gaulle'
      ],
      answer: 3,
    ),
    Question(
      prompt:
      'Saan naganap ang D-Day invasion?',
      type: QType.MultipleChoice,
      options: [
        'A. Normandy, France',
        'B. Berlin, Germany',
        'C. Rome, Italy',
        'D. Tokyo, Japan'
      ],
      answer: 2,
    ),
    Question(
      prompt:
      'Ano ang codename ng proyektong lumikha ng atomic bomb?',
      type: QType.MultipleChoice,
      options: [
        'A. Eagle Project',
        'B. Manhattan Project',
        'C. Apollo Mission',
        'D. Axis Plan'
      ],
      answer: 3,
    ),
    Question(
      prompt:
      'Sino ang lider ng Soviet Union noong WWII?',
      type: QType.MultipleChoice,
      options: [
        'A. Nikita Khrushchev',
        'B. Joseph Stalin',
        'C. Vladimir Lenin',
        'D. Leon Trotsky'
      ],
      answer: 3,
    ),
    // Dificult
    Question(
      prompt:
      'Ano ang tawag sa kasunduang nilagdaan nina Hitler at Stalin bago ang WWII?',
      type: QType.MultipleChoice,
      options: [
        'A. Yalta Pact',
        'B. Molotov–Ribbentrop Pact',
        'C. Potsdam Agreement',
        'D. Atlantic Charter'
      ],
      answer: 3,
    ),
    Question(
      prompt:
      'Ano ang pangunahing layunin ng Blitzkrieg?',
      type: QType.MultipleChoice,
      options: [
        'A. Mabagal na paglusob',
        'B. Mabilis na atake gamit ang eroplano, tangke, at sundalo',
        'C. Pagtatanggol ng teritoryo',
        'D. Diplomasya'
      ],
      answer: 3,
    ),
    Question(
      prompt:
      'Ano ang pangunahing dahilan ng pagbagsak ng Japan noong 1945?',
      type: QType.MultipleChoice,
      options: [
        'A. Paglusob ng Russia',
        'B. Paggamit ng Estados Unidos ng atomic bomb sa Hiroshima at Nagasaki',
        'C. Gutom at krisis sa ekonomiya',
        'D. Pagtutol ng Axis Powers'
      ],
      answer: 3,
    ),
    Question(
      prompt:
      'Sino ang kilalang heneral ng Allied Forces sa Europe?',
      type: QType.MultipleChoice,
      options: [
        'A. Dwight D. Eisenhower',
        'B. Douglas MacArthur',
        'C. George Patton',
        'D. Bernard Montgomery'
      ],
      answer: 2,
    ),
    Question(
      prompt:
      'Ano ang epekto ng WWII sa buong mundo?',
      type: QType.MultipleChoice,
      options: [
        'A. Pagbuo ng League of Nations',
        'B. Pagkakatatag ng United Nations',
        'C. Paglawak ng Ottoman Empire',
        'D. Pagkakaisa ng Axis Powers'
      ],
      answer: 3,
    ),

  ],
  color: Colors.lightGreen,
  icon: FontAwesomeIcons.earthEurope,
);

final eraColdWar = Era(
  id: 'wwii',
  title: 'Cold War',
  backgroundImage: 'assets/eraBackground/coldwar.png',
  subtitle: '1947-1991',
  questions: [
    Question(
      prompt:
      'Kailan nagsimula ang Cold War?',
      type: QType.MultipleChoice,
      options: [
        'A. 1939',
        'B. 1945',
        'C. 1950',
        'D. 1962'
      ],
      answer: 3,
    ),
    Question(
      prompt:
      'Alin ang dalawang pangunahing bansa na naglabanan sa Cold War?',
      type: QType.MultipleChoice,
      options: [
        'A. Germany at Italy',
        'B. USA at USSR',
        'C. Britain at France',
        'D. China at Japan'
      ],
      answer: 3,
    ),
    Question(
      prompt:
      'Ano ang ideolohiyang tinaguyod ng Estados Unidos?',
      type: QType.MultipleChoice,
      options: [
        'A. Komunismo',
        'B. Kapitalismo at Demokrasya',
        'C. Sosyalismo',
        'D. Pasismo'
      ],
      answer: 3,
    ),
    Question(
      prompt:
      'Ano ang simbolo ng Cold War sa Europe?',
      type: QType.MultipleChoice,
      options: [
        'A. Berlin Wall',
        'B. Eiffel To.wer',
        'C. Kremlin',
        'D. White House'
      ],
      answer: 2,
    ),
    // Average
    Question(
      prompt:
      'Ano ang tinaguriang “proxy war” sa Asya?',
      type: QType.MultipleChoice,
      options: [
        'A. Korean War',
        'B. Vietnam War',
        'C. Gulf War',
        'D. Afghanistan War'
      ],
      answer: 2,
    ),
    Question(
      prompt:
      'Sino ang Punong Ministro ng Britain noong WWII?',
      type: QType.MultipleChoice,
      options: [
        'A. Neville Chamberlain',
        'B. Winston Churchill',
        'C. Franklin Roosevelt',
        'D. Charles de Gaulle'
      ],
      answer: 3,
    ),
    Question(
      prompt:
      'Saan naganap ang D-Day invasion?',
      type: QType.MultipleChoice,
      options: [
        'A. Normandy, France',
        'B. Berlin, Germany',
        'C. Rome, Italy',
        'D. Tokyo, Japan'
      ],
      answer: 2,
    ),
    Question(
      prompt:
      'Ano ang codename ng proyektong lumikha ng atomic bomb?',
      type: QType.MultipleChoice,
      options: [
        'A. Eagle Project',
        'B. Manhattan Project',
        'C. Apollo Mission',
        'D. Axis Plan'
      ],
      answer: 3,
    ),
    Question(
      prompt:
      'Sino ang lider ng Soviet Union noong WWII?',
      type: QType.MultipleChoice,
      options: [
        'A. Nikita Khrushchev',
        'B. Joseph Stalin',
        'C. Vladimir Lenin',
        'D. Leon Trotsky'
      ],
      answer: 3,
    ),
    // Dificult
    Question(
      prompt:
      'Ano ang tawag sa kasunduang nilagdaan nina Hitler at Stalin bago ang WWII?',
      type: QType.MultipleChoice,
      options: [
        'A. Yalta Pact',
        'B. Molotov–Ribbentrop Pact',
        'C. Potsdam Agreement',
        'D. Atlantic Charter'
      ],
      answer: 3,
    ),
    Question(
      prompt:
      'Ano ang pangunahing layunin ng Blitzkrieg?',
      type: QType.MultipleChoice,
      options: [
        'A. Mabagal na paglusob',
        'B. Mabilis na atake gamit ang eroplano, tangke, at sundalo',
        'C. Pagtatanggol ng teritoryo',
        'D. Diplomasya'
      ],
      answer: 3,
    ),
    Question(
      prompt:
      'Ano ang pangunahing dahilan ng pagbagsak ng Japan noong 1945?',
      type: QType.MultipleChoice,
      options: [
        'A. Paglusob ng Russia',
        'B. Paggamit ng Estados Unidos ng atomic bomb sa Hiroshima at Nagasaki',
        'C. Gutom at krisis sa ekonomiya',
        'D. Pagtutol ng Axis Powers'
      ],
      answer: 3,
    ),
    Question(
      prompt:
      'Sino ang kilalang heneral ng Allied Forces sa Europe?',
      type: QType.MultipleChoice,
      options: [
        'A. Dwight D. Eisenhower',
        'B. Douglas MacArthur',
        'C. George Patton',
        'D. Bernard Montgomery'
      ],
      answer: 2,
    ),
    Question(
      prompt:
      'Ano ang epekto ng WWII sa buong mundo?',
      type: QType.MultipleChoice,
      options: [
        'A. Pagbuo ng League of Nations',
        'B. Pagkakatatag ng United Nations',
        'C. Paglawak ng Ottoman Empire',
        'D. Pagkakaisa ng Axis Powers'
      ],
      answer: 3,
    ),

  ],
  color: Colors.lightBlueAccent,
  icon: FontAwesomeIcons.snowflake,
);
// --- LIST OF ALL ERAS ---
final allEras = [
  eraWWI,
  eraWWII,
  eraColdWar
];
