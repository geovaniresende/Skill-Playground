import 'dart:math';
import 'package:flutter/material.dart';

class CustomPainterScreen extends StatelessWidget {
  const CustomPainterScreen({super.key});

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
      body: Center(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: CustomPaint(
              size: const Size(220, 220),
              painter: BadgePainter(),
            ),
          ),
        ),
      ),
    );
  }
}

class BadgePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final bg = Paint()..color = Colors.indigo.shade200;
    final ring = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..color = Colors.indigo;

    canvas.drawRRect(
      RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(24)),
      bg,
    );

    canvas.drawCircle(center, size.shortestSide * 0.25, ring);

    final star = Path();
    for (int i = 0; i < 5; i++) {
      final angle = (72.0 * i - 90) * pi / 180.0;
      final r = size.shortestSide * 0.18;
      star.lineTo(center.dx + r * cos(angle), center.dy + r * sin(angle));
    }
    star.close();

    final starPaint = Paint()..color = Colors.amber;
    canvas.drawPath(star, starPaint);
  }

  @override
  bool shouldRepaint(covariant BadgePainter oldDelegate) => false;
}
