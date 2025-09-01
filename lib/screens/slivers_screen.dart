import 'package:flutter/material.dart';

class SliversScreen extends StatelessWidget {
  const SliversScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = List.generate(30, (i) => 'Item $i');

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 16),
        itemCount: items.length + 1,
        itemBuilder: (_, i) {
          if (i == 0) {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Intro fixa acima da lista',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }
          final item = items[i - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(Icons.view_stream, color: Colors.blue.shade900),
                title: Center(
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  debugPrint('Clicou em $item');
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
