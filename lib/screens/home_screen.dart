import 'package:flutter/material.dart';
import '../router/app_route.dart';
import '../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> _items = const [
    {
      'title': 'CustomPainter Basics',
      'page': AppPage.customPainter,
      'icon': Icons.brush
    },
    {
      'title': 'Navigator 2.0 / RouterDelegate',
      'page': AppPage.router20,
      'icon': Icons.router
    },
    {
      'title': 'Bloc State Management',
      'page': AppPage.bloc,
      'icon': Icons.settings
    },
    {
      'title': 'Platform Channels',
      'page': AppPage.platform,
      'icon': Icons.phone_android
    },
    {
      'title': 'Performance & Repaints',
      'page': AppPage.performance,
      'icon': Icons.speed
    },
    {'title': 'Async Isolates', 'page': AppPage.isolate, 'icon': Icons.memory},
    {
      'title': 'AnimationController Lifecycle',
      'page': AppPage.animation,
      'icon': Icons.animation
    },
    {
      'title': 'StreamBuilder Error Handling',
      'page': AppPage.stream,
      'icon': Icons.stream
    },
    {
      'title': 'Custom Slivers',
      'page': AppPage.slivers,
      'icon': Icons.view_stream
    },
  ];

  @override
  Widget build(BuildContext context) {
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
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, i) {
          final item = _items[i];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(item['icon'], color: Colors.blue.shade900),
              title: Center(
                child: Text(
                  item['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => goTo(item['page']),
            ),
          );
        },
      ),
    );
  }
}
