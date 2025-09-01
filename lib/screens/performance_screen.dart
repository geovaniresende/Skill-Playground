import 'package:flutter/material.dart';

class PerformanceScreen extends StatelessWidget {
  const PerformanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(2000, (i) => i);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
      ),
      backgroundColor: Colors.grey.shade100,
      body: RepaintBoundary(
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (_, i) => _HeavyTile(index: i),
        ),
      ),
    );
  }
}

class _HeavyTile extends StatelessWidget {
  final int index;
  const _HeavyTile({required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(Icons.speed, color: Colors.blue.shade900),
        title: Text(
          'Item $index',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: const Text('Render estável dentro de RepaintBoundary'),
      ),
    );
  }
}
