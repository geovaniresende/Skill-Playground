import 'package:flutter/material.dart';
import '../router/app_route.dart';
import '../main.dart';

class Router20DemoScreen extends StatelessWidget {
  final void Function(AppPage) onNavigate;
  const Router20DemoScreen({super.key, required this.onNavigate});

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              _buildCardButton(
                context,
                title: 'Ir para Home (programático)',
                onTap: () => onNavigate(AppPage.home),
                icon: Icons.home,
              ),
              _buildCardButton(
                context,
                title: 'Ir para Bloc (global goTo)',
                onTap: () => goTo(AppPage.bloc),
                icon: Icons.settings,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardButton(BuildContext context,
      {required String title,
      required VoidCallback onTap,
      required IconData icon}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: SizedBox(
          width: 200,
          height: 80,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: Colors.blue.shade900),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
