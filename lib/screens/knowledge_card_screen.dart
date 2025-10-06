import 'package:flutter/material.dart';

class KnowledgeCardScreen extends StatelessWidget {
  const KnowledgeCardScreen({Key? key}) : super(key: key);

  Widget buildCard(String title, String text) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(text),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Karunungan Card - Review')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          buildCard('WWI - Mahahalagang Punto',
              'Nagsimula 1914; Trigger: Pagpaslang kay Archduke Franz Ferdinand; Natapos 1918; Treaty of Versailles (1919).'),
          buildCard('WWII - Mahahalagang Punto',
              'Nagsimula 1939; Pearl Harbor 1941; D-Day 1944; Japan sumuko 1945; United Nations itinatag.'),
          buildCard('Cold War - Mahahalagang Punto',
              'Ideolohikal na tunggalian; Berlin Wall 1961; Cuban Missile Crisis 1962; Pagbagsak 1989-1991.'),
        ],
      ),
    );
  }
}
