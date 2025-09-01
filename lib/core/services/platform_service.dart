import 'package:flutter/services.dart';

class PlatformService {
  static const MethodChannel _channel =
      MethodChannel('skill_playground/platform');

  Future<String> getPlatformVersion() async {
    try {
      final version = await _channel.invokeMethod<String>('getPlatformVersion');
      return version ?? 'unknown';
    } on PlatformException catch (e) {
      return 'Platform error: ${e.message}';
    }
  }
}
