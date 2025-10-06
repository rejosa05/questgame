import 'package:flutter/material.dart';
import '../models/data.dart';
import 'era_detail_screen.dart';

class EraListScreen extends StatelessWidget {
  const EraListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pumili ng Yugto')),
      body: ListView.builder(
        itemCount: allEras.length,
        itemBuilder: (context, index) {
          final era = allEras[index];
          return ListTile(
            title: Text(era.title),
            subtitle: Text(era.subtitle),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EraDetailScreen(era: era),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
