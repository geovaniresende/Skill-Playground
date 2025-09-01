import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

String heavy(Map<String, int> m) {
  final n = m['n'] ?? 1000;
  final list = List.generate(n, (i) => {'i': i, 'sq': i * i});
  return jsonEncode(list);
}

void main() {
  test('compute returns big json', () async {
    final out = await compute(heavy, {'n': 1500});
    expect(out.length, greaterThan(1000));
  });
}
