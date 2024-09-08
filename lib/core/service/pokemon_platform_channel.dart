import 'package:flutter/services.dart';

class PokemonPlatformChannel {
  var platform = MethodChannel('samples.flutter.dev/battery');

  Future<String> getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    return batteryLevel;
  }
}
