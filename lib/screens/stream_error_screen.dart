import 'dart:async';
import 'package:flutter/material.dart';

class StreamErrorScreen extends StatefulWidget {
  const StreamErrorScreen({super.key});

  @override
  State<StreamErrorScreen> createState() => _StreamErrorScreenState();
}

class _StreamErrorScreenState extends State<StreamErrorScreen> {
  late Stream<int> _stream;

  @override
  void initState() {
    super.initState();
    _stream = _buildErroneousStream();
  }

  Stream<int> _buildErroneousStream() async* {
    yield 1;
    await Future.delayed(const Duration(milliseconds: 300));
    throw Exception('Falhou ao obter dados');
  }

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
            child: StreamBuilder<int>(
              stream: _stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.error_outline,
                          size: 48, color: Colors.red),
                      const SizedBox(height: 16),
                      Text(
                        'Ops! ${snapshot.error}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () =>
                              setState(() => _stream = _buildErroneousStream()),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade900,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Tentar novamente',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                if (!snapshot.hasData) return const CircularProgressIndicator();
                return Text(
                  'Primeiro valor: ${snapshot.data}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
